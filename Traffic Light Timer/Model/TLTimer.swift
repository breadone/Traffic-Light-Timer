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
    var RedTime: Float
    
    init(g: Float, y: Float, r: Float) {
        self.GreenTime = g
        self.YellowTime = y
        self.RedTime = r
    }
    
    init(g: Int, y: Int, r: Float) {
        self.GreenTime = Float(g)
        self.YellowTime = Float(y)
        self.RedTime = Float(r)
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

