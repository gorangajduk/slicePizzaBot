//
//  DeliveryPoint.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class DeliveryPoint: Point {
    // input string must be in [x],[y] format
    convenience init?(fromString: String) {
        let array = fromString.split(separator: ",")

        if array.count != 2 {
            // invalid input string
            return nil
        }

        let pointXTemp = String(array[0])
        let pointYTemp = String(array[1])

        let pointX = Int(pointXTemp)
        let pointY = Int(pointYTemp)
        if (pointX != nil) &&
            (pointY != nil) {
            // map can not be created from negative values
            if pointX! < 0 ||
                pointY! < 0 {
                return nil
            }
            self.init(coordinateX: pointX!, coordinateY: pointY!)
        } else {
            return nil
        }
    }
}
