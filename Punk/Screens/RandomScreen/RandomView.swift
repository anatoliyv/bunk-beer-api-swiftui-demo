//
//  RandomView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct RandomView: View {
    @ObservedObject var model: RandomViewModel

    var body: some View {
        let content = VStack {
            Spacer()

            if model.state == .success {
                BeerImageView(url: model.imageURL, width: 250)

                Text(model.title)
                    .font(.title)

                if !model.description.isEmpty {
                    Text(model.description)
                        .font(.headline)
                        .padding()
                }

                let detailsModel = model.model(for: model.beer)
                NavigationLink(destination: BeerDetailsView(model: detailsModel)) {
                    HStack {
                        Text("See details")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.accentColor)
                }
                .padding()

            } else if model.state == .loading {
                ProgressView()
            }

            Spacer()

            Button(
                action: { model.pressed() },
                label: { Text(model.buttonTitle) })
                .buttonStyle(BlueButtonStyle())
        }
        .padding(40)
        .multilineTextAlignment(.center)

        #if os(macOS)
        content
        #else
        content
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Try Random Beer")
        #endif
    }
}

#if DEBUG
struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RandomViewModel(appState: AppState.mock)
        model.prepareForPreview()

        let view = NavigationView {
            RandomView(model: model)
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
    }
}
#endif
