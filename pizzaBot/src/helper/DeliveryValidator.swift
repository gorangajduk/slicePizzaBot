//
//  DeliveryValidator.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

class DeliveryValidator: NSObject {
    class func validateDelivery(delivery: DeliveryOrder) -> Bool {
        // iterate through all delivery points
        for deliveryPoint in delivery.deliveryPoints {
            // if a delivery point is invalid the delivery order is also considered invalid
            if !delivery.map.isDeliveryPointValid(deliveryPoint: deliveryPoint) {
                return false
            }
        }
        return true
    }
}
