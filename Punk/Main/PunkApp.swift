//
//  PunkApp.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

@main
struct PunkApp: App {
    var body: some Scene {
        let appState = AppState()
        let model = PunkAppTabViewModel(appState: appState)

        return WindowGroup {
            PunkAppTabView(model: model)
        }
    }
}
