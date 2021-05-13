//
//  Beer.swift
//  Punk
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import Foundation

struct Beer: Identifiable, Codable {
    var id: Int
    var name: String
    var tagline: String?
    var imagePath: String?
    var firstBrewed: String?
    var description: String?
    var foodPairing: [String]?
    var brewersTips: String?
    var contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline, description
        case imagePath = "image_url"
        case firstBrewed = "first_brewed"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

extension Beer: Equatable {
    static func == (lhs: Beer, rhs: Beer) -> Bool {
        lhs.id == rhs.id
    }
}

extension Beer {
    var hasFirstBrewedBadge: Bool {
        guard let firstBrewed = firstBrewed else { return false }
        return firstBrewed.contains("2009") || firstBrewed.contains("2010")
    }
}

extension Beer {
    static var mocks: Mocks = Mocks()

    struct Mocks {
        let empty: Beer = Beer(id: -1, name: "")
        let beerPunk: Beer = Beer(
            id: 1,
            name: "Punk IPA",
            tagline: "Cool cold beer",
            imagePath: "https://images.punkapi.com/v2/192.png",
            firstBrewed: "25 Oct 2010",
            description: "Some text goes here")

        let beerStout: Beer = Beer(
            id: 2,
            name: "YoHoHo Stout",
            tagline: "Cool hot beer",
            imagePath: "https://images.punkapi.com/v2/191.png",
            firstBrewed: "25 Oct 2009",
            description: "Some text goes here")
    }
}
