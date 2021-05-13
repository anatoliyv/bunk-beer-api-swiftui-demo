//
//  BlueButtonStyle.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .shadow(color: .secondary, radius: 3, x: 0, y: 3)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.accentColor)
                }
            )
            .padding(.horizontal)
            .scaleEffect(configuration.isPressed ? 1.01: 1.0)
    }
}

#if DEBUG
struct BlueButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        let view = NavigationView {
            VStack {
                Button(action: {}, label: { Text("Blue Button") })
                    .buttonStyle(BlueButtonStyle())

                Spacer()
            }
            .navigationBarHidden(true)
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 600))
    }
}
#endif
