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
    @State private var showingControls = true
    var timer: TLTimer
    
    init(timer: TLTimer) {
        self.timer = timer
        _model = StateObject(wrappedValue: TimerViewModel(timer: timer))
    }
    
    var body: some View {
        ZStack {
            model.BGColour.ignoresSafeArea()
            VStack {
                Spacer()
                if showingControls {
                    HStack {
                        TimerText
                        Spacer()
                        TimerButtons
                    }.transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
        }
        .onTapGesture { withAnimation { self.showingControls.toggle() }}
        .navigationBarBackButtonHidden(true)
        .statusBar(hidden: true)
        .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
        .onDisappear { UIApplication.shared.isIdleTimerDisabled = false }
    }
    
    var TimerText: some View {
        Text(model.formatSeconds(abs(model.timeRemaining)))
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .medium, design: .rounded))
            .bold()
            .padding(.bottom, 19)
            .padding(.leading, 25)
    }
    
    var TimerButtons: some View {
        HStack {
            Button(action: {model.togglePause()}) {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.white)
                    Image(systemName: model.clockIsActive ? "pause.fill" : "play.fill")
                        .font(.system(size: 21, design: .rounded))
                        .foregroundColor(model.BGColour)
                }
            }
            
            Button(action: {model.finish(); presmode.wrappedValue.dismiss()}) {
                Text("Done")
                    .foregroundColor(model.BGColour)
                    .font(.system(size: 21, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(width: 75, height: 30, alignment: .center)
                    .padding(.init(top: 10, leading: 18, bottom: 10, trailing: 18))
                    .background(Capsule().foregroundColor(.white))
            }
            .padding(.trailing, 18)
        }
        .padding(.bottom, 18)
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TLTimer(green: (1, 20), yellow: (0, 2)))
    }
}
