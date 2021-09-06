//
//  TimerViewModel.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 6/09/21.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeRemaining: Float
    @Published var BGColour: Color = .green

    var timer: TLTimer

//    var clock = Timer.publish(every: 1, on: .main, in: .common)
//        .autoconnect()
        
    var clock: Timer!
    
    init(timer: TLTimer) {
        self.timer = timer
        self.timeRemaining = timer.GreenTime
        self.clock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        print(timeRemaining)
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            switch BGColour {
            case .green:
                self.BGColour = .yellow
                self.timeRemaining = timer.YellowTime
            case .yellow:
                self.BGColour = .red
                self.timeRemaining = timer.RedTime
            case .red:
                print("timer done")
            default:
                break
            }
        }
    }
    
}


