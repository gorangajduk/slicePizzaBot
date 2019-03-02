//
//  DeliveryValidatorTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

class DeliveryValidationTests: XCTestCase {
    func testvalidDelivery() {
        var map = Map(sizeWidth: 10, sizeHeight: 10)

        var deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 2, coordinateY: 2)!)
        deliveryPoints.append(DeliveryPoint(coordinateX: 4, coordinateY: 1)!)
        deliveryPoints.append(DeliveryPoint(coordinateX: 5, coordinateY: 0)!)

        var deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)

        XCTAssertTrue(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be valid")

        map = Map(sizeWidth: 0, sizeHeight: 0)

        deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 0, coordinateY: 0)!)

        deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)

        XCTAssertTrue(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be valid")
    }

    func testInvalidDeliveries() {
        var map = Map(sizeWidth: 10, sizeHeight: 0)

        var deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 2, coordinateY: 2)!)

        var deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)
        XCTAssertFalse(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be invalid")

        map = Map(sizeWidth: 1, sizeHeight: 1)

        deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 2, coordinateY: 2)!)

        deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)
        XCTAssertFalse(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be invalid")

        map = Map(sizeWidth: 0, sizeHeight: 1)

        deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 2, coordinateY: 2)!)

        deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)
        XCTAssertFalse(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be invalid")

        map = Map(sizeWidth: 10, sizeHeight: 10)

        deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 21, coordinateY: 2)!)

        deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)
        XCTAssertFalse(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be invalid")

        map = Map(sizeWidth: 10, sizeHeight: 10)

        deliveryPoints = [DeliveryPoint]()
        deliveryPoints.append(DeliveryPoint(coordinateX: 1, coordinateY: 21)!)

        deliveryOrder = DeliveryOrder(map: map!, dPoints: deliveryPoints)
        XCTAssertFalse(DeliveryValidator.validateDelivery(delivery: deliveryOrder), "delivery should be invalid")
    }
}
