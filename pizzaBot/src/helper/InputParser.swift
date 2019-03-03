//
//  InputValidator.swift
//  pizzaBot
//
//  Created by slice on 01/03/2019.
//

import Foundation

/**
 input parser that parses the input string to a DeliveryOrder object.
 */
class InputParser: NSObject {
    /// Regex for a valid input pattern
    static let inputPattern = "^(\\d+x\\d+)((\\s\\(\\d+\\,\\s\\d\\))+)"

    /**
     Parses the input string in to a DeliveryOrder object.
     
     - Parameters:
     - inputString: The input string
     
     - Returns: The DeliveryOrder object or nil if the input string is not in the valid format.
     */
    class func parseInput(inputString: String) -> DeliveryOrder? {
        var deliveryOrder: DeliveryOrder?

        do {
            // create the regex
            let regex = try NSRegularExpression(pattern: inputPattern,
                                                options: [])
            // range of the input string
            let range = NSRange(inputString.startIndex..<inputString.endIndex,
                                in: inputString)

            regex.enumerateMatches(in: inputString,
                                   options: [],
                                   range: range) { (match, _, stop) in
                                    guard let match = match else { return }

                                    if match.numberOfRanges == 4,
                                        let mapSizeRange = Range(match.range(at: 1),
                                                                 in: inputString),
                                        let locationsArrayRange = Range(match.range(at: 2),
                                                                        in: inputString) {
                                        // create the Map
                                        let mapSizeInputString = String(inputString[mapSizeRange])
                                        let map = Map.init(fromString: mapSizeInputString)

                                        // Create the Delivery Points
                                        let locationsArrayInputString = String(inputString[locationsArrayRange])
                                        let deliveryPoints =
                                            InputParser.generateDeliveryPoints(fromString: locationsArrayInputString)
                                        if map != nil {
                                            deliveryOrder = DeliveryOrder(map: map!,
                                                                          dPoints: deliveryPoints)
                                        }
                                        stop.pointee = true
                                    }
            }
        } catch {
            return nil
        }
        return deliveryOrder
    }

    /**
     Creates an array of DeliveryPoints from string.
     
     - Parameters:
        - fromString: The input string
     
     - Returns: An array of DeliveryPoint objects.
     */

    class func generateDeliveryPoints(fromString: String) -> [DeliveryPoint] {
        var deliveryPoints = [DeliveryPoint]()

        // create a mutable variable of the input string
        var deliveryString = fromString
        // the input string will be in a (x, y) (x, y) ... format
        // first we clear all whitespaces
        deliveryString = String(deliveryString.filter { !" ".contains($0) })
        // than we remove all (
        deliveryString = String(deliveryString.filter { !"(".contains($0) })
        // the input string will be x,y)x,y)x,y)....
        // we split the string by )
        let deliveryPointsArrayString = deliveryString.split(separator: ")")
        // which will give us an array of x,y elements
        // for each element in the array we try to create a delivery point
        for deliveryPointString in deliveryPointsArrayString {
            if let deliveryPoint = DeliveryPoint(fromString: String(deliveryPointString)) {
                // if a dalivery point is created add it to the array
                deliveryPoints.append(deliveryPoint)
            }
        }
        return deliveryPoints
    }
}
