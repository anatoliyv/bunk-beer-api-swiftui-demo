//
//  FavoritesViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Combine
import Foundation

class FavoritesViewModel: ObservableObject, BeerDisplayingProtocol {
    @Published var beers: [Beer] = []

    internal var appState: AppState

    private var cancellables: [AnyCancellable] = []

    // MARK: - Lifecycle

    init(appState: AppState) {
        self.appState = appState

        setupObservables()
    }

    private func setupObservables() {
        appState.$favoriteBeers
            .assign(to: \.beers, on: self)
            .store(in: &cancellables)
    }
}

// MARK: - Actions
extension FavoritesViewModel {
    func pressedDelete(indexes: IndexSet) {
        for index in indexes {
            let beer = beers[index]
            appState.toggleFavorite(for: beer)
        }
    }
}

#if DEBUG
extension FavoritesViewModel {
    func prepareForPreview() {
        beers = [Beer.mocks.beerPunk]
    }
}
#endif
