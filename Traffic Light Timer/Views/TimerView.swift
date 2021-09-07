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
            model.BGColour
                .ignoresSafeArea()
            TimerText
                .foregroundColor(.white)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var TimerText: some View {
        VStack {
            Spacer()
            Text(String(format: "%.0f", abs(model.timeRemaining)))
                .font(.system(size: 40, weight: .medium, design: .rounded))
                .bold()
            Spacer()
            Button(action: {model.finish();presmode.wrappedValue.dismiss()}) {
                Text("Done")
                    .foregroundColor(model.BGColour)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 20, alignment: .center)
                    .padding(.init(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Color.white).cornerRadius(12)
            }
            .padding(.bottom, 18)
            
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TLTimer(g: 20, y: 5))
    }
}
