//
//  AppState.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

class AppState: ObservableObject {
    @Published var favoriteBeers: [Beer] = []

    private(set) var client: APIClient

    // swiftlint:disable:next implicitly_unwrapped_optional
    private var repository: BeerModelsRepository!
    private let favoritesUserDefaultKey: String = "__favorite_beer_ids"

    // MARK: - Lifecycle

    init() {
        let pathGenerator = PathGenerator(host: "https://api.punkapi.com/v2/")
        self.client = APIClient(pathGenerator: pathGenerator)
        self.repository = BeerModelsRepository(appState: self)

        loadFavoriteFromUserDefaults()
    }

    func detailsModel(for beer: Beer) -> BeerDetailsViewModel {
        repository.detailsModel(for: beer)
    }

    func cellModel(for beer: Beer) -> BeerCellViewModel {
        repository.cellModel(for: beer)
    }
}

// MARK: - Favorites
extension AppState {
    func isBeerFavorited(_ beer: Beer) -> Bool {
        favoriteBeers.contains(beer)
    }

    func toggleFavorite(for beer: Beer) {
        isBeerFavorited(beer)
            ? removeFromFavorite(beer)
            : addToFavorite(beer)
    }

    private func addToFavorite(_ beer: Beer) {
        favoriteBeers.append(beer)
        cellModel(for: beer).isFavorited = true
        detailsModel(for: beer).isFavorited = true
        updateFavoriteUserDefaults()
    }

    private func removeFromFavorite(_ beer: Beer) {
        favoriteBeers.removeAll { $0 == beer }
        cellModel(for: beer).isFavorited = false
        detailsModel(for: beer).isFavorited = false
        updateFavoriteUserDefaults()
    }

    private func updateFavoriteUserDefaults() {
        let ids = favoriteBeers.map { $0.id }
        UserDefaults.standard.set(ids, forKey: favoritesUserDefaultKey)
    }

    private func loadFavoriteFromUserDefaults() {
        guard let ids = UserDefaults.standard.value(forKey: favoritesUserDefaultKey) as? [Int] else { return }

        let endpoint = Endpoint<[Beer]>(
            method: .get,
            api: .beerIds(ids: ids))

        client.performRequest(endpoint: endpoint) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .failure:
                break
            case .success(let content):
                content.forEach { self.addToFavorite($0) }
            }
        }
    }
}

#if DEBUG
extension AppState {
    static var mock: AppState {
        AppState()
    }
}
#endif
