//
//  Timer.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import Foundation

public class Timer: ObservableObject, Codable {
    var name: String
    
    var GreenTime: Date
    var YellowTime: Date
    var RedTime: Date
    
    init(_ name: String = "no name", gTime: Date, yTime: Date, rTime: Date) {
        self.name = name
        self.GreenTime = gTime
        self.YellowTime = yTime
        self.RedTime = rTime
    }
    
    init() {
        self.name = "no name"
        self.GreenTime = Date()
        self.YellowTime = Date()
        self.RedTime = Date()
    }
    
}

struct Minute {
    var minute: Int = 0
    var second: Int = 0
    
    var nowPlus: Date {
        let components = DateComponents(minute: minute, second: second)
        return Calendar(identifier: .gregorian).date(from: components)!
    }
}
