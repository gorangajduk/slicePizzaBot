//
//  Delivery.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 DeliveryOrder class that contains the map and the delivery points.
 */
class DeliveryOrder: NSObject {
    let map: Map
    let deliveryPoints: [DeliveryPoint]

    /**
     Initializes a delivery order.
     
     - Parameters:
        - map: The map of the delivery order.
        - dPoints: The delivery points of the delivery order.
     
     - Returns: The initialised delivery order.
     */
    init(map: Map, dPoints: [DeliveryPoint]) {
        self.map  = map
        self.deliveryPoints = dPoints
    }
}
