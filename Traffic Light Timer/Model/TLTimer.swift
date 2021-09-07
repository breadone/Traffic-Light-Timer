//
//  Timer.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import Foundation

public class TLTimer: ObservableObject, Codable {
    var GreenTime: Int
    var YellowTime: Int
    
    init(g: Int, y: Int) {
        self.GreenTime = g
        self.YellowTime = y
    }
}

struct Minute {
    var minute: Int = 0
    var second: Int = 0
    
    var totalSeconds: Int {
        (minute * 60) + second
    }
}

