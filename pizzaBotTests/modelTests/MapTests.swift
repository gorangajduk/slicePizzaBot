//
//  MapTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

class MapTests: XCTestCase {
    func testValidMapCreation() {
        let input = "15x23"
        let map = Map(fromString: input)
        XCTAssertTrue(map != nil, "Map object should be created from valid input")
        XCTAssertTrue(map?.width == 15, "map width should be 15")
        XCTAssertTrue(map?.height == 23, "map height should be 23")
    }

    func testInvalidMapCreation() {
        var input = "-13x5"
        var map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")

        input = "13x-5"
        map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")

        input = "13x"
        map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")

        input = "x5"
        map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")

        input = "x"
        map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")

        input = ""
        map = Map(fromString: input)
        XCTAssertNil(map, "Map object should not be created from invalid input string")
    }
}
