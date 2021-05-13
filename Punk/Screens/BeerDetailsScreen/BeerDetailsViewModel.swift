//
//  BeerDetailsViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Combine
import Foundation

class BeerDetailsViewModel: ObservableObject {
    @Published var isFavorited: Bool = false

    private(set) var beer: Beer

    private var appState: AppState

    // MARK: - Lifecycle

    init(beer: Beer, appState: AppState) {
        self.beer = beer
        self.isFavorited = appState.isBeerFavorited(beer)
        self.appState = appState

        setupObservables()
    }

    private func setupObservables() {

    }
}

// MARK: - Properties
extension BeerDetailsViewModel {
    var title: String {
        beer.name
    }

    var subtitle: String {
        beer.tagline ?? ""
    }

    var description: String {
        beer.description ?? ""
    }

    var firstBrewed: String {
        beer.firstBrewed ?? ""
    }

    var foodPairing: [String] {
        beer.foodPairing ?? []
    }

    var brewerTips: String {
        beer.brewersTips ?? ""
    }

    var contributedBy: String {
        beer.contributedBy ?? ""
    }

    var hasFirstBrewedBadge: Bool {
        beer.hasFirstBrewedBadge
    }

    var imageURL: URL? {
        guard let path = beer.imagePath else { return nil }
        return URL(string: path)
    }

    var favoriteImageName: String {
        isFavorited ? "heart.slash.fill" : "heart.fill"
    }

    var favoriteButtonTitle: String {
        isFavorited ? "Unfavorite" : "Favorite"
    }
}

// MARK: - Actions
extension BeerDetailsViewModel {
    func pressedFavorite() {
        appState.toggleFavorite(for: beer)
    }
}

#if DEBUG
extension BeerDetailsViewModel {
    func prepareForPreview() {
        beer = .mocks.beerPunk
    }
}
#endif
