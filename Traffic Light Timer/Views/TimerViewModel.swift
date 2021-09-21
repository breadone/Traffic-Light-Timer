//
//  TimerViewModel.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 6/09/21.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeRemaining: Int
    @Published var BGColour: Color

    var timer: TLTimer
    private var clock: Timer!
    @Published var clockIsActive: Bool = true
    
    init(timer: TLTimer) {
        self.timer = timer
        
        if timer.GreenTime != 0 {
            self.timeRemaining = timer.GreenTime
            self.BGColour = .green
        } else if timer.YellowTime != 0 {
            self.timeRemaining = timer.YellowTime
            self.BGColour = .yellow
        } else {
            self.timeRemaining = 0
            self.BGColour = .red
        }
        
        self.clock = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(update),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc private func update() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            switch BGColour {
            case .green:
                if timer.YellowTime != 0 {
                    toYellow()
                } else {
                    redLoop()
                }
            case .yellow:
                redLoop()
            case .red:
                redLoop()
            default:
                break
            }
        }
    }
    
    private func toYellow() {
        self.BGColour = .yellow
        self.timeRemaining = timer.YellowTime
    }
    
    private func redLoop() {
        self.BGColour = .red
        self.timeRemaining -= 1
    }
    
    public func finish() {
        self.clock.invalidate()
    }
    
    public func togglePause() {
        if clockIsActive {
            self.clock.invalidate()
            self.clockIsActive.toggle()
        } else {
            self.clock = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(update),
                                              userInfo: nil,
                                              repeats: true)
            self.clockIsActive.toggle()
        }
    }
    
    public func formatSeconds(_ seconds: Int) -> String {
        let minutes = floor(Double(seconds) / 60)
        let rSeconds = Double(seconds) - (minutes * 60)
        
        return String(format: "%0.0f:%02.0f", minutes, rSeconds)
    }
    
}


