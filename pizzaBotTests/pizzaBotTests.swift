//
//  pizzaBotTests.swift
//  pizzaBotTests
//
//  Created by slice on 01/03/2019.
//  Copyright © 2019 slice. All rights reserved.
//

import XCTest
@testable import pizzaBot

/**
 Used for testing the PizzaBot.
 */
class PizzaBotTests: XCTestCase {
    /// Valid test to confim the pizza bot is providing the expected result.
    func testPizzaBot() {
        let bot = SliceBot()
        let input = "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        let expectedinstructions = "DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD"
        let deliveryInstructions = bot.deliver(input: input)
        XCTAssertTrue(deliveryInstructions == expectedinstructions, "Delivery instructions incorect.")
    }
}
