//
//  APIError.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

struct APIError: Codable {
    var statusCode: Int
    var error: String
    var message: String
    var data: [Data]?

    enum CodingKeys: String, CodingKey {
        case statusCode, error, message, data
    }
}

extension APIError {
    struct Data: Codable {
        var message: String

        enum CodingKeys: String, CodingKey {
            case message = "msg"
        }
    }
}
