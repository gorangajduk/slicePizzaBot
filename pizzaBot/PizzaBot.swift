//
//  pizzaBot.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import Foundation

/**
 Slicebot class that parses and validates the input string and provides instructions on how to perform the delivery.
 */
class SliceBot: NSObject {
    /**
     Method that returns the path with instructions for delivery.

     - Parameters:
        -inputString: string that contains the map size and locations for the delivery

     - Returns: String instructions for the delivery or an error message
     */
    func deliver(input: String) -> String {
        // parse the input string to a delivery order
        if let deliveryOrder = InputParser.parseInput(inputString: input) {
            // validate the delivery order
            if DeliveryValidator.validateDelivery(delivery: deliveryOrder) {
                // create the executor
                let executor = Executor(dOrder: deliveryOrder)
                // execute the delivery
                return executor.executeDelivery()
            } else {
                return "Invalid delivery order"
            }
        } else {
            return "Invalid input format"
        }
    }
}
