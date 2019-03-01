//
//  main.swift
//  pizzaBot
//
//  Created by G Gajduk on 01/03/2019.
//

import Foundation

struct Point {
    let x: Int
    let y: Int
}

func parsePoints(input: String) -> [Point]? {
    // input format is a list of (x, y)
    var pointsString = input
    // first remove whitespaces
    pointsString = String(pointsString.filter { !" ".contains($0) })
    
    // remove all (
    pointsString = String(pointsString.filter { !"(".contains($0) })
    
    // split the resulting string by )
    let pointArrayString = pointsString.split(separator: ")")
    
    var points = [Point]()
    for pointString in pointArrayString {
        // each of the temp is in format x,y
        var point: Point? = nil
        
        let pointArray = pointString.split(separator: ",")
        if pointArray.count != 2 {
            return nil
        }
        let pointXTemp = String(pointArray[0])
        let pointYTemp = String(pointArray[1])
        
        if let pointX = Int(pointXTemp) {
            if let pointY = Int(pointYTemp) {
                // points cannot have negative values
                if pointX >= 0 &&
                    pointY >= 0 {
                    point = Point(x: pointX, y: pointY)
                }
            }
        }
        
        if point != nil {
            points.append(point!)
        } else {
            return nil
        }
    }
    
    return points
}

// validates that all points are inside the map
func confirmPoints(mapSize: Point, points: [Point]) -> Bool {
    for point in points {
        if mapSize.x < point.x ||
            mapSize.y < point.y {
            return false
        }
        
        // points cannot be negative
        if point.x < 0 ||
            point.y < 0 {
            return false
        }
    }
    return true
}

func getMovement(start: Point, end: Point) -> String {
    var outputString = ""
    // get the distance needed to travel
    let horizontalDistance = end.x - start.x
    let verticalDistance = end.y - start.y
    
    // initial direction is East
    var horizontalDirection = "E"
    // if the distance is negative number, the direction is west
    if horizontalDistance < 0 {
        horizontalDirection = "W"
    }
    
    // get the number of steps
    let horizontalSteps = abs(horizontalDistance)
    var start = 0
    while start < horizontalSteps {
        outputString.append(horizontalDirection)
        start += 1
    }
    
    // initial direction is North
    var verticalDirection = "N"
    // if the distance is negative number the direction is oposite
    if verticalDistance < 0 {
        verticalDirection = "S"
    }
    
    let verticalSteps = abs(verticalDistance)
    start = 0
    while start < verticalSteps {
        outputString.append(verticalDirection)
        start += 1
    }
    
    outputString.append("D")
    
    return outputString
}

func pizzabot(input: String) -> String {
    // split the string by ' ''
    let tempArray = input.split(separator: " ")
    if tempArray.count > 0 {
        // the map size is the first element
        let mapSizeString = tempArray[0]
        let mapSizeArray = mapSizeString.split(separator: "x")
        
        if mapSizeArray.count != 2 {
            return "Invalid map size format"
        }
        var mapSizeTemp: Point? = nil
        
        let mapSizeXTemp = String(mapSizeArray[0])
        let mapSizeYTemp = String(mapSizeArray[1])
        
        if let mapSizeX = Int(mapSizeXTemp) {
            if let mapSizeY = Int(mapSizeYTemp) {
                if mapSizeX < 0 ||
                    mapSizeY < 0 {
                    return "Invalid map size"
                }
                mapSizeTemp = Point(x: mapSizeX, y: mapSizeY)
            }
        }
        
        if mapSizeTemp == nil {
            return "Invalid map format"
        }
        
        let mapSize = mapSizeTemp!
        
        var deliveryPointsString = input
        
        // remove the map size substring from the input string
        deliveryPointsString = deliveryPointsString.replacingOccurrences(of: mapSizeString, with: "")
        // get the points
        if let deliveryPoints = parsePoints(input: deliveryPointsString) {
            // confirm all points are in the map
            if confirmPoints(mapSize: mapSize, points: deliveryPoints) {
                var currentLocation = Point(x: 0, y: 0)
                var outputString = ""
                // get the travel string
                for point in deliveryPoints {
                    outputString.append(getMovement(start: currentLocation, end: point))
                    currentLocation = point
                }
                return outputString
            } else {
                return "Points outside map"
            }
        } else {
            return "Invalid points format"
        }
    }
    
    return "Invalid input format"
}

// regular case
assert(pizzabot(input: "5x5 (1, 3) (4, 4)") == "ENNNDEEEND")
// one of the poins has y outside map
assert(pizzabot(input: "5x5 (1, 6) (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3)") == "Points outside map")
// one of the points has x outside map
assert(pizzabot(input: "5x5 (1, 3) (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (7, 1) (3, 2) (2, 3)") == "Points outside map")
// point is 0,0 so no movement only delivery
assert(pizzabot(input: "5x5 (0, 0))") == "D")
// zero map size
assert(pizzabot(input: "0x0 (0, 0)") == "D")
// invalid map size format
assert(pizzabot(input: "-5x-5 (0, 0))") == "Invalid map size")
assert(pizzabot(input: "-5x5 (0, 0))") == "Invalid map size")
assert(pizzabot(input: "5x-5 (0, 0))") == "Invalid map size")
assert(pizzabot(input: "5x (0, 0))") == "Invalid map size format")
assert(pizzabot(input: "x5 (0, 0))") == "Invalid map size format")
// invalid points format
assert(pizzabot(input: "5x5 (E, N)") == "Invalid points format")
assert(pizzabot(input: "5x5 (-2, 0) (0, 1)") == "Invalid points format")
assert(pizzabot(input: "5x5 (2, 0) (0, -1)") == "Invalid points format")
assert(pizzabot(input: "5x5 (, )") == "Invalid points format")
assert(pizzabot(input: "5x5 ~, >)") == "Invalid points format")



let result = pizzabot(input: "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)")
print(result)

