//
//  TimerView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.presentationMode) private var presmode
    @StateObject var model: TimerViewModel
    var timer: TLTimer
    
    init(timer: TLTimer) {
        self.timer = timer
        _model = StateObject(wrappedValue: TimerViewModel(timer: timer))
    }
    
    var body: some View {
        ZStack {
            model.BGColour.ignoresSafeArea()
            TimerText
                .foregroundColor(.white)
        }.navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    var TimerText: some View {
        if model.timeRemaining != -2 {
            Text(String(format: "%.0f", model.timeRemaining))
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .bold()
        } else {
            VStack {
                Text("Timer Finished")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .bold()
                
                Button(action: {presmode.wrappedValue.dismiss()}) {
                    Text("Done")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.red)
                        .padding()
                }
                .frame(width: 130, height: 50)
                .background(Color.white)
                .cornerRadius(17)
            }
        }
    }
    
    var TimerCircle: some View {
        Text("")
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TLTimer(g: 20, y: 5, r: 10))
    }
}
