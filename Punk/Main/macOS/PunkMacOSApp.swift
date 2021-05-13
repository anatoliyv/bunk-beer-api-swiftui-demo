//
//  Punk__macOS_App.swift
//  Punk (macOS)
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

@main
struct PunkMacOSApp: App {
    var body: some Scene {
        let appState = AppState()
        let model = PunkAppTabViewModel(appState: appState)

        return WindowGroup {
            PunkAppTabView(model: model)
                .frame(minWidth: 600, minHeight: 600)
        }
    }
}
