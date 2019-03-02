//
//  InputParserTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

/**
 Used for testing the InputParser.
 */
class InputParserTests: XCTestCase {
    /// Test to confirm the InputParser is working as expected.
    func testValidInput() {
        let input = "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        let deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertTrue(deliveryOrder != nil, "Delivery order object should be created.")
        XCTAssertTrue(deliveryOrder?.map != nil, "Delivery order should contain a valid map object.")
        XCTAssertTrue(deliveryOrder?.map.width == 5, "Map width should be 5.")
        XCTAssertTrue(deliveryOrder?.map.height == 5, "Map height should be 5.")
        XCTAssertTrue(deliveryOrder?.deliveryPoints.count == 9, "Delivery order should contain 9 delivery points.")
        XCTAssertTrue(deliveryOrder?.deliveryPoints[0].xCoordinate == 0, "First delivery point x should be 0.")
        XCTAssertTrue(deliveryOrder?.deliveryPoints[0].yCoordinate == 0, "First delivery point y should be 0.")
    }

    /// Test to confirm the InputParser handles invalid inputs.
    func testInvalidInput() {
        var input = "5x5 (E, N)"
        var deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x5 (, )"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "x5 (0, 0))"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x (0, 0))"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x5 ~, >)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x5 (3, )"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x5 (, 4)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")

        input = "5x5 (0, ) (1 3) (4 4) (4 2) (4 2) (0 1) (3 2) (2 3) (4 1)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "Delivery order should not be created from invalid input.")
    }
}
