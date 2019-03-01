//
//  pizzaBot.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import Foundation

class SliceBot: NSObject {
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
