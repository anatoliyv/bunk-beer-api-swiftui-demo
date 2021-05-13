//
//  UIApplication+EndEditing.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import UIKit

// Extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
