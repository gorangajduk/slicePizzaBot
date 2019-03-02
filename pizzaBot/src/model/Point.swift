//
//  Point.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 Point class containing the X and Y coordinate.
 */
class Point: NSObject {
    var xCoordinate: Int
    var yCoordinate: Int

    /**
     Initializes a point. A point can not be created from negative coordinates.
     
     - Parameters:
     - coordinateX: The x coordinate.
     - coordinateY: The y coordinate.
     
     - Returns: Point or nil if one or both coordinates are negative numbers.
     */
    init?(coordinateX: Int, coordinateY: Int) {
        // coordinates cannot be negative numbers
        if coordinateX >= 0  &&
            coordinateY >= 0 {
            self.xCoordinate = coordinateX
            self.yCoordinate = coordinateY
        } else {
            // in this case a valid delivery point can not be created
            return nil
        }
    }
}
