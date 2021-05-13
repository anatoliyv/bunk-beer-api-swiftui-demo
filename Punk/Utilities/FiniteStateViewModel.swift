//
//  FiniteStateViewModel.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

enum ViewModelState {
    case none
    case loading
    case error(FailureReason)
    case success
}

protocol FiniteStateViewModel {
    var state: ViewModelState { get }
}

extension ViewModelState: Equatable {
    public static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case let (.error(lhsError), .error(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.none, .none), (.success, .success), (.loading, .loading):
            return true
        default:
            return false
        }
    }
}
