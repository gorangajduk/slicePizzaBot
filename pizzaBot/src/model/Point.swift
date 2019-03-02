//
//  Point.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class Point: NSObject {
    var xCoordinate: Int
    var yCoordinate: Int

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
