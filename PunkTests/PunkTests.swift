//
//  PunkTests.swift
//  PunkTests
//
//  Created by Anatoliy Voropay on 13.05.2021.
//

import XCTest
@testable import Punk

class BeerModelTests: XCTestCase {

    func testHasBrewedBadge() {
        let beerHas: Beer = Beer(
            id: 1,
            name: "YoHoHo Stout",
            firstBrewed: "25 Oct 2009")
        XCTAssertTrue(beerHas.hasFirstBrewedBadge)

        let beerHasNot: Beer = Beer(
            id: 1,
            name: "YoHoHo Stout",
            firstBrewed: "25 Oct 2011")
        XCTAssertFalse(beerHasNot.hasFirstBrewedBadge)
    }

    func testMore() {
        // TODO: More tests welcome
        XCTFail("Cmon")
    }
}
