//
//  BeerDisplayingProtocol.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

protocol BeerDisplayingProtocol {
    var appState: AppState { get }
}

extension BeerDisplayingProtocol {
    func detailsModel(for beer: Beer) -> BeerDetailsViewModel {
        appState.detailsModel(for: beer)
    }

    func cellModel(for beer: Beer) -> BeerCellViewModel {
        appState.cellModel(for: beer)
    }
}
