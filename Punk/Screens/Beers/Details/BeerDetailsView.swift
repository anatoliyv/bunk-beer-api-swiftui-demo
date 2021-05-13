//
//  BeerDetailsView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct BeerDetailsView: View {
    @ObservedObject var model: BeerViewModel

    var body: some View {
        let content = ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    BeerImageView(url: model.imageURL, width: 250)
                    Spacer()
                }

                HStack(alignment: .top) {
                    if !model.subtitle.isEmpty {
                        Text(model.subtitle)
                    }

                    Spacer()

                    if !model.firstBrewed.isEmpty {
                        if model.hasFirstBrewedBadge {
                            BrewedBadgeView(text: model.firstBrewed)
                        } else {
                            Text("Since:")
                                .fontWeight(.semibold)
                            Text(model.firstBrewed)
                        }
                    }
                }
                .foregroundColor(.secondary)
                .padding([.horizontal, .top])

                if !model.contributedBy.isEmpty {
                    HStack {
                        Text("Contributed by:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(model.contributedBy)
                            .foregroundColor(.accentColor)
                    }
                    .padding([.horizontal, .top])
                }

                if !model.foodPairing.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Better with next food:")
                            .fontWeight(.semibold)

                        ForEach(model.foodPairing, id: \.self) { pair in
                            HStack {
                                Image(systemName: "circlebadge.fill")
                                Text(pair)
                            }
                            .font(.subheadline)
                            .padding(.leading)
                            .padding(.top, 5)
                        }
                    }
                    .padding([.horizontal, .top])
                }

                if !model.description.isEmpty {
                    Text(model.description)
                        .padding([.horizontal, .top])
                }

                if !model.brewerTips.isEmpty {
                    HStack(alignment: .top) {
                        Image(systemName: "info.circle")
                            .font(.title)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(model.brewerTips)
                    }
                    .padding([.horizontal, .top])
                    .font(.body.italic())
                }
            }
            .padding()
        }

        #if os(macOS)
        content
        #else
        content
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(model.title)
            .navigationBarItems(trailing: favoriteButton)
        #endif
    }

    private var favoriteButton: AnyView {
        Button(
            action: { model.pressedFavorite() },
            label: {
                VStack {
                    Image(systemName: model.favoriteImageName)
                    Text(model.favoriteButtonTitle)
                }
            })
            .toAnyView
    }
}

#if DEBUG
struct BeerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BeerViewModel(beer: .mocks.beerPunk, appState: AppState.mock)

        let view = NavigationView {
            BeerDetailsView(model: model)
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
    }
}
#endif
