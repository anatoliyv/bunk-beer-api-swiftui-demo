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
    func model(for beer: Beer) -> BeerViewModel {
        appState.model(for: beer)
    }
}
