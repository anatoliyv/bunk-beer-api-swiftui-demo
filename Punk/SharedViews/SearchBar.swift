//
//  SearchBar.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing: Bool = false

    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(
                    action: {
                        UIApplication.shared.endEditing()
                        self.isEditing = false
                        self.text = ""
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            }
        }
        .padding(.bottom, 8)
    }
}

#if DEBUG
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        let view = NavigationView {
            SearchBar(text: .constant("Sample search"))
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 400))
    }
}
#endif
