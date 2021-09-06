//
//  TimerView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimerView: View {
    var timer: TLTimer
    let model: TimerViewModel

    @State private var BGColour: Color = .green
    
    @State private var greenTime: Float
    @State private var yellowTime: Float
    @State private var redTime: Float
    
    init(timer: TLTimer) {
        self.timer = timer
        self.model = TimerViewModel(timer: timer)
        self.greenTime = timer.GreenTime
        self.yellowTime = timer.YellowTime
        self.redTime = timer.RedTime
    }
    
    var body: some View {
        ZStack {
            BGColour.ignoresSafeArea()
            TimerText
                .foregroundColor(.white)
        }
    }
    
    var TimerText: some View {
        Text("\(model.timeRemaining)")
            .bold()
    }
    
    var TimerCircle: some View {
        Text("")
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TLTimer(g: 120, y: 5, r: 10))
    }
}
