//
//  Timer.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import Foundation

public struct TLTimer  {
    var greenMinutes, greenSeconds: Int
    var yellowMinutes, yellowSeconds: Int
    
    var GreenTime: Int {
        greenSeconds + greenMinutes * 60
    }
    
    var YellowTime: Int {
        yellowSeconds + yellowMinutes * 60
    }
    
    init(green: (min: Int, sec: Int), yellow: (min: Int, sec: Int)) {
        self.greenMinutes = green.min
        self.greenSeconds = green.sec
        self.yellowMinutes = yellow.min
        self.yellowSeconds = yellow.sec
    }
}
