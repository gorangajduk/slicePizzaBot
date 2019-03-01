//
//  main.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

func pizzabot(input: String) -> String {
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

//// regular case
//assert(pizzabot(input: "5x5 (1, 3) (4, 4)") == "ENNNDEEEND")
//// one of the poins has y outside map
//assert(pizzabot(input: "5x5 (1, 6) (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3)") == "Points outside map")
//// one of the points has x outside map
//assert(pizzabot(input: "5x5 (1, 3) (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (7, 1) (3, 2) (2, 3)") == "Points outside map")
//// point is 0,0 so no movement only delivery
//assert(pizzabot(input: "5x5 (0, 0))") == "D")
//// zero map size
//assert(pizzabot(input: "0x0 (0, 0)") == "D")
//// invalid map size format
//assert(pizzabot(input: "-5x-5 (0, 0))") == "Invalid map size")
//assert(pizzabot(input: "-5x5 (0, 0))") == "Invalid map size")
//assert(pizzabot(input: "5x-5 (0, 0))") == "Invalid map size")
//assert(pizzabot(input: "5x (0, 0))") == "Invalid map size format")
//assert(pizzabot(input: "x5 (0, 0))") == "Invalid map size format")
//// invalid points format
//assert(pizzabot(input: "5x5 (E, N)") == "Invalid points format")
//assert(pizzabot(input: "5x5 (-2, 0) (0, 1)") == "Invalid points format")
//assert(pizzabot(input: "5x5 (2, 0) (0, -1)") == "Invalid points format")
//assert(pizzabot(input: "5x5 (, )") == "Invalid points format")
//assert(pizzabot(input: "5x5 ~, >)") == "Invalid points format")



let result = pizzabot(input: "55x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)")
print(result)

