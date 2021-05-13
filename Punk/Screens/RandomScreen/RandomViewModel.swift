//
//  RandomViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Combine
import Foundation

class RandomViewModel: ObservableObject, FiniteStateViewModel, BeerDisplayingProtocol {
    @Published var state: ViewModelState = .none
    @Published var beer: Beer = Beer.mocks.empty

    internal var appState: AppState

    private var counter: Int = 0

    // MARK: - Lifecycle

    init(appState: AppState) {
        self.appState = appState
    }
}

// MARK: - Properties
extension RandomViewModel {
    var imageURL: URL? {
        guard let path = beer.imagePath else { return nil }
        return URL(string: path)
    }

    var title: String {
        beer.name
    }

    var description: String {
        beer.tagline ?? ""
    }

    var buttonTitle: String {
        counter == 0 ? "Request Random Beer" : "Request Another"
    }
}

// MARK: - Actions
extension RandomViewModel {
    func pressed() {
        state = .loading

        let endpoint = Endpoint<[Beer]>(
            method: .get,
            api: .random)

        appState.client.performRequest(endpoint: endpoint) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .failure(let error):
                self.state = .error(error)
            case .success(let content):
                self.beer = content.first ?? Beer.mocks.empty
                self.state = .success
            }
        }
    }
}

#if DEBUG
extension RandomViewModel {
    func prepareForPreview() {
        beer = .mocks.beerStout
        state = .success
    }
}
#endif
