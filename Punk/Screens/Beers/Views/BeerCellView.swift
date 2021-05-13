//
//  BeerCellView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct BeerCellView: View {
    @ObservedObject var model: BeerViewModel

    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                BeerImageView(url: model.imageURL, width: 70)

                if model.hasFirstBrewedBadge {
                    BrewedBadgeView(text: model.firstBrewed)
                }
            }

            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)

                if !model.subtitle.isEmpty {
                    Text(model.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top, 5)
                }
            }

            if model.isFavorited {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.orange)
                    Spacer()
                }
            }
        }
        .contextMenu {
            Button(
                action: { model.pressedFavorite() },
                label: {
                    Text(model.favoriteButtonTitle)
                    Image(systemName: model.favoriteImageName)
                })
        }
        .padding(.vertical, 16)
    }
}

#if DEBUG
struct BeerCellView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BeerViewModel(beer: Beer.mocks.beerPunk, appState: AppState.mock)
        let view = List {
            BeerCellView(model: model)
        }
        .listStyle(InsetGroupedListStyle())

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 400))
    }
}
#endif
