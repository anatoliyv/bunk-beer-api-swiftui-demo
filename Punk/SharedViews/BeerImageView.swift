//
//  BeerImageView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SDWebImageSwiftUI
import SwiftUI

struct BeerImageView: View {
    var url: URL?
    var width: CGFloat

    var body: some View {
        WebImage(url: url)
            .resizable()
            .placeholder {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width / 2.5, alignment: .center)
                    .foregroundColor(.secondary)
                    .opacity(0.5)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: width, height: width, alignment: .center)
    }
}

#if DEBUG
struct BeerImageView_Previews: PreviewProvider {
    static var previews: some View {
        let view = NavigationView {
            HStack {
                BeerImageView(url: nil, width: 100)
                BeerImageView(url: nil, width: 250)
            }
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 400))
    }
}
#endif
