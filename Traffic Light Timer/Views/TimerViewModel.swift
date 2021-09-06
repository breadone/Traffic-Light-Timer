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
    @Published var mode: TimerMode = .green

    var timer: TLTimer

    let clock = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    init(timer: TLTimer) {
        self.timer = timer
        self.timeRemaining = timer.GreenTime
        let _ = clock.sink { _ in
            self.update()
        }
    }
    
    func update() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            switch mode {
            case .green:
                self.mode = .yellow
                self.timeRemaining = timer.YellowTime
            case .yellow:
                self.mode = .red
                self.timeRemaining = timer.RedTime
            case .red:
                print("timer done")
            }
        }
    }
    
}


