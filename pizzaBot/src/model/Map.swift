//
//  Map.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 Map class containing the width and height.
 */
class Map: NSObject {
    /// The width of the map.
    let width: Int
    /// The height of the map.
    let height: Int

    /**
     Initializes a map from string.
     The string must be in [width]x[height] format.
     
     - Parameters:
        - fromString: The input string.
     
     - Returns: Map or nil if the string is invalid format.
     */
    convenience init?(fromString: String) {
        // split the input string
        let mapArray = fromString.split(separator: "x")

        // validate if the string is split in 2 parts
        if mapArray.count != 2 {
            // invalid input string
            return nil
        }

        // the width of the map
        let mapWidthTemp = String(mapArray[0])
        // the height of the map
        let mapHeightTemp = String(mapArray[1])

        // cast them to Int
        let mapWidth = Int(mapWidthTemp)
        let mapHeight = Int(mapHeightTemp)
        if (mapWidth != nil) &&
            (mapHeight != nil) {
            // map cannot be created from negative values
            if mapWidth! < 0 ||
                mapHeight! < 0 {
                return nil
            }
            self.init(sizeWidth: mapWidth!, sizeHeight: mapHeight!)
        } else {
            return nil
        }
    }

    /**
     Initializes a map.
     
     - Parameters:
        - sizeWidth: The width of the map.
        - sizeHeight: The height of the map.
     
     - Returns: The initialised map.
     */
    init?(sizeWidth: Int, sizeHeight: Int) {
        // coordinates cannot be negative numbers
        if sizeWidth >= 0  &&
            sizeHeight >= 0 {
            self.width = sizeWidth
            self.height = sizeHeight
        } else {
            // in this case a valid map cannot be created
            return nil
        }
    }

    /**
     Verifies if a DeliveryPoint is valid in the map.
     A DeliveryPoint is valid if its coordinates are inside the map.
     
     - Parameters:
        - deliveryPoint: DeliveryPoint that is being validated.
     
     - Returns: True if the point is inside the map or false if one of the points coordinates is ouside the map.
     */
    func isDeliveryPointValid(deliveryPoint: DeliveryPoint) -> Bool {
        // point is considered valid if it is inside the map
        if deliveryPoint.xCoordinate > self.width {
            return false
        }

        if deliveryPoint.xCoordinate < 0 {
            return false
        }

        if deliveryPoint.yCoordinate > self.height {
            return false
        }

        if deliveryPoint.yCoordinate < 0 {
            return false
        }

        return true
    }
}
