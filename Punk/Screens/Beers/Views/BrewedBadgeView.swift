//
//  BrewedBadgeView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct BrewedBadgeView: View {
    var text: String

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: "star.fill")
                .font(.system(size: 10))

            VStack {
                Text("First brewed:")
                    .font(.system(size: 8))
                Text(text)
                    .font(.system(size: 10))
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 4)
        .padding(.vertical, 2)
        .background(
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.yellow)
        )
    }
}

#if DEBUG
struct BrewedBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        let view = NavigationView {
            BrewedBadgeView(text: "Oct 2021")
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 400))
    }
}
#endif
