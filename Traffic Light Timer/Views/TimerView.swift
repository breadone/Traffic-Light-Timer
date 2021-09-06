//
//  TimerView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimerView: View {
    var timer: TLTimer
    @StateObject var model: TimerViewModel

//    @State private var BGColour: Color = .green
    
    init(timer: TLTimer) {
        self.timer = timer
        _model = StateObject(wrappedValue: TimerViewModel(timer: timer))
    }
    
    var body: some View {
        ZStack {
            model.BGColour.ignoresSafeArea()
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
