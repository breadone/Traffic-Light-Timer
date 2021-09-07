//
//  ContentView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct ConfigView: View {
    
    @State private var greenTime = Minute()
    @State private var yellowTime = Minute()
    
    var body: some View {
        NavigationView {
            VStack {
                TimeSelectionView(title: "Green Time",
                                  titleColour: .green,
                                  minute: $greenTime.minute,
                                  second: $greenTime.second)
                
                TimeSelectionView(title: "Yellow Time",
                                  titleColour: .yellow,
                                  minute: $yellowTime.minute,
                                  second: $yellowTime.second)
                Spacer()
                StartButton
                    .padding(.bottom, 18)
            }
            .navigationTitle("Traffic Light Timer")
        }
    }
    
    var StartButton: some View {
        NavigationLink(destination: TimerView(timer: setUpTimer())) {
            Text("Start Timer")
                .font(.system(size: 21, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 320, height: 70, alignment: .center)
                .background(Color.green)
//                .background(Capsule().foregroundColor(.green))
                .cornerRadius(17)
        }
    }
}

extension ConfigView {
    func setUpTimer() -> TLTimer {
        return TLTimer(g: greenTime.totalSeconds,
                       y: yellowTime.totalSeconds)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}



