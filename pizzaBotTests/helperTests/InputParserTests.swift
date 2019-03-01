//
//  InputParserTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

class InputParserTests: XCTestCase {
    func testValidInput() {
        let input = "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        let deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertTrue(deliveryOrder != nil, "delivery order object should be created")
        XCTAssertTrue(deliveryOrder?.map != nil, "delivery order should contain a valid map object")
        XCTAssertTrue(deliveryOrder?.map.width == 5, "map width should be 5")
        XCTAssertTrue(deliveryOrder?.map.height == 5, "map height should be 5")
        XCTAssertTrue(deliveryOrder?.deliveryPoints.count == 9, "delivery order should contain 9 delivery points")
        XCTAssertTrue(deliveryOrder?.deliveryPoints[0].x == 0, "first delivery point x should be 0")
        XCTAssertTrue(deliveryOrder?.deliveryPoints[0].y == 0, "first delivery point y should be 0")
    }
    
    func testInvalidInput() {
        var input = "5x5 (E, N)"
        var deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x5 (, )"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "x5 (0, 0))"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x (0, 0))"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x5 ~, >)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x5 (3, )"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x5 (, 4)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
        
        input = "5x5 (0, ) (1 3) (4 4) (4 2) (4 2) (0 1) (3 2) (2 3) (4 1)"
        deliveryOrder = InputParser.parseInput(inputString: input)
        XCTAssertNil(deliveryOrder, "delivery order should not be created from invalid input")
    }
}
