//
//  DeliveryValidator.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 Validator for delivery order.
 */
class DeliveryValidator: NSObject {
    /**
     Validates a deliveryOrder. Delivery order is considered valid if all delivery points are inside the map.
     
     - Parameters:
        - delivery the delivery ordeer that is being validated.
     
     - Returns: true if the delivery order is valid or false if the delivery order can not be completed.
     */
    class func validateDelivery(delivery: DeliveryOrder) -> Bool {
        // iterate through all delivery points
        for deliveryPoint in delivery.deliveryPoints {
            // if a delivery point is invalid the delivery order is also considered invalid
            if !delivery.map.isDeliveryPointValid(deliveryPoint: deliveryPoint) {
                return false
            }
        }
        // if all delivery points are valid, the delivery order is also valid
        return true
    }
}
