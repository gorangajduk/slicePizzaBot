//
//  DeliveryPoint.swift
//  pizzaBot
//
//  Created by G Gajduk on 01/03/2019.
//

import Foundation

class DeliveryPoint: NSObject {
    let x: Int
    let y: Int
    
    init?(coordinateX: Int, coordinateY: Int) {
        // coordinates cannot be negative numbers
        if coordinateX >= 0  &&
            coordinateY >= 0 {
            self.x = coordinateX
            self.y = coordinateY
        } else {
            // in this case a valid delivery point can not be created
            return nil
        }
    }
}
