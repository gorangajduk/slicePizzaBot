//
//  Map.swift
//  pizzaBot
//
//  Created by G Gajduk on 01/03/2019.
//

import Foundation

class Map: NSObject {
    let width: Int
    let height: Int
    
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
}
