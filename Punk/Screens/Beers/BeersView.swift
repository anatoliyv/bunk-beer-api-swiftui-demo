//
//  BeersView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct BeersView: View {
    @ObservedObject var model: BeersViewModel

    var body: some View {
        let content = VStack {
            SearchBar(text: $model.query)
                .padding(.horizontal, 10)

            List {
                switch model.state {
                case .error(let error):
                    ErrorView(failureReason: error)

                case .success, .none, .loading:
                    if !model.beers.isEmpty {
                        Section {
                            ForEach(model.beers) { beer in
                                let detailsModel = model.model(for: beer)
                                NavigationLink(destination: BeerDetailsView(model: detailsModel)) {
                                    BeerCellView(model: detailsModel)
                                }
                            }
                        }
                    }

                    if model.canLoadMore || model.beers.isEmpty {
                        Section {
                            LoadingCellView()
                                .onAppear {
                                    if model.beers.isEmpty {
                                        model.viewDidAppear()
                                    } else {
                                        model.loadMore()
                                    }
                                }
                        }
                    }
                }
            }
        }

        #if os(macOS)
        content
        #else
        content
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Punk Beers Directory")
        #endif
    }
}

#if DEBUG
struct BeersView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BeersViewModel(appState: AppState.mock)
        model.prepareForPreview()

        let view = NavigationView {
            BeersView(model: model)
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
    }
}
#endif
