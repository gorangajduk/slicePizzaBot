//
//  Executor.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class Executor: NSObject {
    var currentLocation: Point
    let deliveryOrder: DeliveryOrder
    
    init(dOrder: DeliveryOrder) {
        self.deliveryOrder = dOrder
        // starting position is 0, 0
        currentLocation = Point(coordinateX: 0, coordinateY: 0)!
    }
    
    func executeDelivery() -> String {
        var resultString = ""
        for deliveryPoint in deliveryOrder.deliveryPoints {
            let moveOrders = getMoveOrders(start: currentLocation, destination: deliveryPoint)
            resultString.append(moveOrders)
            // move the current location
            currentLocation = deliveryPoint
        }
        return resultString
    }
        
    func getMoveOrders(start: Point, destination: Point) -> String {
        var moveOrders = ""
        // get the distance needed to travel
        let horizontalDistance = destination.x - start.x
        let verticalDistance = destination.y - start.y
        
        // first we move horizontaly
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
        // find the direction of travel
        // initial direction is North
        var verticalDirection = "N"
        // if the distance is negative number the direction is oposite
        if verticalDistance < 0 {
            verticalDirection = "S"
        }
        
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
