//
//  BeerModelsRepository.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

class BeerModelsRepository {
    private var appState: AppState
    private var cachedDetailModels: [BeerDetailsViewModel] = []
    private var cachedCellModels: [BeerCellViewModel] = []

    // MARK: - Lifecycle

    init(appState: AppState) {
        self.appState = appState
    }

    func detailsModel(for beer: Beer) -> BeerDetailsViewModel {
        guard let model = cachedDetailModels.first(where: { $0.beer == beer }) else {
            let model = BeerDetailsViewModel(beer: beer, appState: appState)
            cachedDetailModels.append(model)
            return model
        }
        return model
    }

    func cellModel(for beer: Beer) -> BeerCellViewModel {
        guard let model = cachedCellModels.first(where: { $0.beer == beer }) else {
            let model = BeerCellViewModel(beer: beer, appState: appState)
            cachedCellModels.append(model)
            return model
        }
        return model
    }
}
