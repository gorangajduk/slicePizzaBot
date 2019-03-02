//
//  DeliveryPointTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

/**
 Used for testing the Deliverypoint creation from string.
 */
class DeliveryPointTests: XCTestCase {
    /// Test to confirm the delivery point is created from valid input string.
    func testValidDeliveryPointCreation() {
        let input = "8,12"
        let deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertTrue(deliveryPoint != nil, "DeliveryPoint object should be created from valid input.")
        XCTAssertTrue(deliveryPoint?.xCoordinate == 8, "DeliveryPoint x should be 8.")
        XCTAssertTrue(deliveryPoint?.yCoordinate == 12, "DeliveryPoint y should be 12.")
    }

    /// Test to confirm delivery point is not created from invalid input string.
    func testInvalidDeliveryPointCreation() {
        var input = "-13,5"
        var deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")

        input = "6,-8"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")

        input = "3,"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")

        input = ",0"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")

        input = ","
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")

        input = ""
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should not be created from invalid input string.")
    }
}
