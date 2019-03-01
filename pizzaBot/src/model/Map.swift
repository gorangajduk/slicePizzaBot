//
//  Map.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class Map: NSObject {
    let width: Int
    let height: Int
    
    // input string must be in [width]x[height] format
    convenience init?(fromString: String) {
        let mapArray = fromString.split(separator: "x")
        
        if mapArray.count != 2 {
            // invalid input string
            return nil
        }
        
        let mapWidthTemp = String(mapArray[0])
        let mapHeightTemp = String(mapArray[1])
        
        let mapWidth = Int(mapWidthTemp)
        let mapHeight = Int(mapHeightTemp)
        if (mapWidth != nil) &&
            (mapHeight != nil) {
            // map can not be created from negative values
            if mapWidth! < 0 ||
                mapHeight! < 0 {
                return nil
            }
            self.init(sizeWidth: mapWidth!, sizeHeight: mapHeight!)
        } else {
            return nil
        }
    }
    
    init?(sizeWidth: Int, sizeHeight: Int) {
        // coordinates cannot be negative numbers
        if sizeWidth >= 0  &&
            sizeHeight >= 0 {
            self.width = sizeWidth
            self.height = sizeHeight
        } else {
            // in this case a valid map can not be created
            return nil
        }
    }
    
    func isDeliveryPointValid(deliveryPoint: DeliveryPoint) -> Bool {
        // point is considered valid if it is inside the map
        if deliveryPoint.x > self.width {
            return false
        }
        
        if deliveryPoint.x < 0 {
            return false
        }
        
        if deliveryPoint.y > self.height {
            return false
        }
        
        if deliveryPoint.y < 0 {
            return false
        }
        
        return true
    }
}
