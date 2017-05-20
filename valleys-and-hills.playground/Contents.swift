//: Playground - noun: a place where people can play

import UIKit

var landscape = [1, 2, 3, 4, 5, 2]

/*
 
 Castle condition:
    Ignoring the plateaus if slope is changing direction we have a Castle
 
 */

func findCastleLocations( topography: [Int]) -> Int {
    
    enum angle {
        case flat
        case incline
        case decline
    }
    
    var oldSlope = angle.flat
    var castleLocale = topography.isEmpty ? 0 : 1
    
    guard !topography.isEmpty else { return 0}
    
    for i in 0..<topography.count - 1 {
        
        let angle = topography[i + 1] - topography[i]
        // + is an incline
        // - is a decline
        // 0 is a plateau
        
        /*
         Castle condition:
         Ignoring the plateaus; if slope is changing direction we have a castle
         */
        
        if angle < 0 {
            
            if oldSlope == .incline {
                castleLocale += 1
            }
            
            oldSlope = .decline
            
        } else if angle > 0 {
            
            if oldSlope == .decline {
                castleLocale += 1
            }
            
            oldSlope = .incline
        }
    }
    
    return castleLocale
}

print(findCastleLocations(topography: landscape))

