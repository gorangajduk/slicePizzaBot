//
//  Executor.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 Executor which provides the instructions for the delivery.
 */
class Executor: NSObject {
    /// The delivery order that needs to be executed
    let deliveryOrder: DeliveryOrder

    /**
     Initializes a new executor with a delivery order.
     
     - Parameters:
        - dOrder: The order that needs to be executed.
     
     - Returns: The initialised executor.
     */
    init(dOrder: DeliveryOrder) {
        self.deliveryOrder = dOrder
    }

    /**
     Executes the delivery order and returns the delivery instructions.
     
     - Returns: The delivery instructions.
     */
    func executeDelivery() -> String {
        // initialising the output string
        var resultString = ""
        // set the starting location, deliveries always start from 0, 0
        var currentLocation = Point(coordinateX: 0, coordinateY: 0)!
        // iterate through the delivery points
        for deliveryPoint in deliveryOrder.deliveryPoints {
            // get the instructions to move from the current location to the next delivery point
            let moveOrders = getMoveOrders(start: currentLocation, destination: deliveryPoint)
            // append the instructions to the result string
            resultString.append(moveOrders)
            // move the current location
            currentLocation = deliveryPoint
        }
        return resultString
    }

    /**
     Calculates the delivery instructions from one point to another
     
     - Parameters:
     - start: The starting point.
     - destination: The destination point.
     
     - Returns: The delivery instructions from the start point to the delivery point.
     */
    func getMoveOrders(start: Point, destination: Point) -> String {
        // initialise the output string
        var moveOrders = ""

        // first we move horizontaly
        // get the distance needed to travel
        let horizontalDistance = destination.xCoordinate - start.xCoordinate
        // find the direction of travel
        // initial direction is East
        var horizontalDirection = "E"
        // if the distance is negative number, the direction is west
        if horizontalDistance < 0 {
            horizontalDirection = "W"
        }

        // get the number of steps
        let horizontalSteps = abs(horizontalDistance)
        var counter = 0
        while counter < horizontalSteps {
            moveOrders.append(horizontalDirection)
            counter += 1
        }

        // then vertically
        // get the distance needed to travel
        let verticalDistance = destination.yCoordinate - start.yCoordinate
        // find the direction of travel
        // initial direction is North
        var verticalDirection = "N"
        // if the distance is negative number the direction is oposite
        if verticalDistance < 0 {
            verticalDirection = "S"
        }

        // get the number of steps
        let verticalSteps = abs(verticalDistance)
        counter = 0
        while counter < verticalSteps {
            moveOrders.append(verticalDirection)
            counter += 1
        }
        // when you arrive at the destionation we append the delivery order
        moveOrders.append("D")
        return moveOrders
    }
}
