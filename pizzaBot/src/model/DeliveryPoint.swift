//
//  DeliveryPoint.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 DeliveryPoint class containing a conveninence initialiser from string.
 */
class DeliveryPoint: Point {
    /**
     Initializes a delivery point from string.
     The string must be in [x],[y] format.
     
     - Parameters:
        - fromString: The input string.
     
     - Returns: Delivery point or nil if the string is invalid format.
     */
    convenience init?(fromString: String) {
        // split the input string
        let array = fromString.split(separator: ",")

        // validate if the string is split in 2 parts
        if array.count != 2 {
            // invalid input string
            return nil
        }

        // first point
        let pointXTemp = String(array[0])
        // second point
        let pointYTemp = String(array[1])

        // cast the points to Int
        let pointX = Int(pointXTemp)
        let pointY = Int(pointYTemp)
        if (pointX != nil) &&
            (pointY != nil) {
            self.init(coordinateX: pointX!, coordinateY: pointY!)
        } else {
            return nil
        }
    }
}
