//
//  Delivery.swift
//  pizzaBot
//
//  Created by G Gajduk on 01/03/2019.
//

import Foundation

class Delivery: NSObject {
    let map: Map
    let deliveryPoints: [DeliveryPoint]
    
    init(m: Map, dp: [DeliveryPoint]) {
        self.map  = m
        self.deliveryPoints = dp
    }
}
