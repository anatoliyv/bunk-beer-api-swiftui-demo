//
//  LoadingCellView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

struct LoadingCellView: View {
    var body: some View {
        Section(header: HStack {
            Spacer()
            ProgressView()
                .padding(.vertical, 16)
            Spacer()
        }) {}
    }
}

#if DEBUG
struct LoadingCellView_Previews: PreviewProvider {
    static var previews: some View {
        let view = List {
            LoadingCellView()
        }

        return Group {
            view
            view.colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 400))
    }
}
#endif
