//
//  Delivery.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class DeliveryOrder: NSObject {
    let map: Map
    let deliveryPoints: [DeliveryPoint]
    
    init(m: Map, dp: [DeliveryPoint]) {
        self.map  = m
        self.deliveryPoints = dp
    }
}
