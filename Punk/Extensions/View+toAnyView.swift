//
//  View+toAnyView.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import SwiftUI

extension View {
    var toAnyView: AnyView {
        AnyView(self)
    }
}
