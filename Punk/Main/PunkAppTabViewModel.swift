//
//  PunkAppTabViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Combine

class PunkAppTabViewModel: ObservableObject {
    @Published var tabIndex: Int = 0

    private(set) var beersViewModel: BeersViewModel
    private(set) var randomViewModel: RandomViewModel
    private(set) var favoritesViewModel: FavoritesViewModel

    private var appState: AppState
    private var cancellables: [AnyCancellable] = []

    // MARK: - Lifecycle

    init(appState: AppState) {
        self.appState = appState
        self.beersViewModel = BeersViewModel(appState: appState)
        self.randomViewModel = RandomViewModel(appState: appState)
        self.favoritesViewModel = FavoritesViewModel(appState: appState)

        setupObservables()
    }

    private func setupObservables() {
        $tabIndex
            .dropFirst()
            .sink { index in
                print("New tab index: \(index)")
            }
            .store(in: &cancellables)
    }
}

// MARK: - Properties
extension PunkAppTabViewModel {
    var beersImageName: String {
        tabIndex == 0 ? "character.book.closed.fill" : "character.book.closed"
    }

    var randomImageName: String {
        tabIndex == 1 ? "graduationcap.fill" : "graduationcap"
    }

    var favoritesImageName: String {
        tabIndex == 2 ? "suit.heart.fill" : "suit.heart"
    }
}

#if DEBUG
extension PunkAppTabViewModel {
    func prepareForPreview() {

    }
}
#endif
