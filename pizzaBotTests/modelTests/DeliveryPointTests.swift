//
//  DeliveryPointTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

class DeliveryPointTests: XCTestCase {
    func testValidDeliveryPointCreation() {
        let input = "8,12"
        let deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertTrue(deliveryPoint != nil, "DeliveryPoint object should be created from valid input")
        XCTAssertTrue(deliveryPoint?.x == 8, "DeliveryPoint x should be 8")
        XCTAssertTrue(deliveryPoint?.y == 12, "DeliveryPoint y should be 12")
    }
    
    func testInvalidDeliveryPointCreation() {
        var input = "-13,5"
        var deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
        
        input = "6,-8"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
        
        input = "3,"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
        
        input = ",0"
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
        
        input = ","
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
        
        input = ""
        deliveryPoint = DeliveryPoint(fromString: input)
        XCTAssertNil(deliveryPoint, "DeliveryPoint object should ne be created from invalid input string")
    }
}
