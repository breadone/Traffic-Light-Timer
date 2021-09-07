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
    var clock: Timer!
    
    init(timer: TLTimer) {
        self.timer = timer
        self.timeRemaining = timer.GreenTime
        self.clock = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(update),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func update() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            switch BGColour {
            case .green:
                if timer.YellowTime != 0 {
                    toYellow()
                } else if timer.RedTime != 0 {
                    toRed()
                } else { toFinish() }
                
            case .yellow:
                if timer.RedTime != 0 {
                    toRed()
                } else {
                    toFinish()
                }
                
            case .red:
                toFinish()
            default:
                break
            }
        }
    }
    
    fileprivate func toYellow() {
        self.BGColour = .yellow
        self.timeRemaining = timer.YellowTime
    }
    
    fileprivate func toRed() {
        self.BGColour = .red
        self.timeRemaining = timer.RedTime
    }
    
    fileprivate func toFinish() {
        self.BGColour = .red
        self.clock.invalidate()
        self.timeRemaining = -2
    }
    
}


