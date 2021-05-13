//
//  FavoritesView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var model: FavoritesViewModel

    var body: some View {
        let content = VStack {
            List {
                if model.beers.isEmpty {
                    Text("You do not have favourite beers yet. Use heart icon or context menu to add one")
                        .multilineTextAlignment(.center)
                        .padding()
                }

                let message = !model.beers.isEmpty
                    ? "Use swipe or cell context menu (long tap) to remove beer from favorites"
                    : ""
                Section(footer: Text(message)) {
                    ForEach(model.beers) { beer in
                        let model = model.model(for: beer)
                        NavigationLink(destination: BeerDetailsView(model: model)) {
                            BeerCellView(model: model)
                        }
                    }
                    .onDelete { model.pressedDelete(indexes: $0) }
                }
            }
        }

        #if os(macOS)
        content
        #else
        content
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Your Favourites")
        #endif
    }
}

#if DEBUG
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        let model = FavoritesViewModel(appState: AppState.mock)
        model.prepareForPreview()

        let view = NavigationView {
            FavoritesView(model: model)
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
    }
}
#endif
