//
//  BeerCellViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Combine
import Foundation

class BeerCellViewModel: ObservableObject {
    @Published var isFavorited: Bool

    private(set) var beer: Beer

    private var appState: AppState

    // MARK: - Lifecycle

    init(beer: Beer, appState: AppState) {
        self.beer = beer
        self.appState = appState
        self.isFavorited = appState.isBeerFavorited(beer)
    }
}

// MARK: - Properties
extension BeerCellViewModel {
    var title: String {
        beer.name
    }

    var description: String {
        beer.tagline ?? ""
    }

    var hasFirstBrewedBadge: Bool {
        beer.hasFirstBrewedBadge
    }

    var firstBrewed: String {
        beer.firstBrewed ?? ""
    }

    var imageURL: URL? {
        guard let path = beer.imagePath else { return nil }
        return URL(string: path)
    }

    var favoriteImageName: String {
        isFavorited ? "heart.slash.fill" : "heart.fill"
    }

    var favoriteButtonText: String {
        isFavorited ? "Remove from favorites" : "Favorite"
    }
}

// MARK: - Actions
extension BeerCellViewModel {
    func pressedFavorite() {
        appState.toggleFavorite(for: beer)
    }
}

#if DEBUG
extension BeerCellViewModel {
    func prepareForPreview() {
        beer = Beer.mocks.beerStout
    }
}
#endif
