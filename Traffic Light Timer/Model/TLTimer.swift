//
//  Timer.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import Foundation

public class TLTimer: ObservableObject, Codable {
    var GreenTime: Float
    var YellowTime: Float
    
    init(g: Float, y: Float) {
        self.GreenTime = g
        self.YellowTime = y
    }
    
    init(g: Int, y: Int) {
        self.GreenTime = Float(g)
        self.YellowTime = Float(y)
    }
}

struct Minute {
    var minute: Int = 0
    var second: Int = 0
    
    var totalSeconds: Int {
        (minute * 60) + second
    }
    
    var nowPlus: Date {
        let components = DateComponents(minute: minute, second: second)
        return Calendar(identifier: .gregorian).date(from: components)!
    }
}

