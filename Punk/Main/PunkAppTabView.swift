//
//  PunkAppTabView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct PunkAppTabView: View {
    typealias TabData = (name: String, icon: String, view: AnyView)

    @ObservedObject var model: PunkAppTabViewModel

    var body: some View {
        let views: [TabData] = [
            ("Beers", model.beersImageName, BeersView(model: model.beersViewModel).toAnyView),
            ("Random", model.randomImageName, RandomView(model: model.randomViewModel).toAnyView),
            ("Favorites", model.favoritesImageName, FavoritesView(model: model.favoritesViewModel).toAnyView)
        ]

        #if os(iOS)
        TabView(selection: $model.tabIndex) {
            let data = Array(zip(views.indices, views))
            ForEach(data, id: \.0) { index, view in
                NavigationView {
                    view.view
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem { Label(view.name, systemImage: view.icon) }
                .tag(index)
            }
        }
        #else
        NavigationView {
            List {
                Text("Punk")
                ForEach(Array(zip(views.indices, views)), id: \.0) { index, view in
                    NavigationLink(destination: view.view.padding()) {
                        Label(view.name, systemImage: view.icon)
                    }

                    if index == 0 {
                        Spacer()
                        Text("More")
                    }
                }
            }
            .listStyle(SidebarListStyle())
        }
        #endif
    }
}

#if DEBUG
struct PunkAppTabView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
#endif
