//
//  ContentView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct ConfigView: View {
    
    @State private var gM: Int = 0
    @State private var gS: Int = 0
    
    @State private var yM: Int = 0
    @State private var yS: Int = 0
    
//    @State private var green: (min: Int, sec: Int) = (min: 0, sec: 10)
//    @State private var yellow: (min: Int, sec: Int) = (0, 0)
    
    var body: some View {
        NavigationView {
            VStack {
                TimeSelectionView(title: "Green Time",
                                  titleColour: .green,
                                  minute: $gM,
                                  second: $gS)
                
                TimeSelectionView(title: "Yellow Time",
                                  titleColour: .yellow,
                                  minute: $yM,
                                  second: $yS)
                Spacer()

                StartButton
                    .padding(.bottom, 18)
            }
            .navigationTitle("Traffic Light Timer")
        }
    }
    
    @ViewBuilder
    var StartButton: some View {
        NavigationLink(destination: TimerView(timer: setUpTimer())) {
            Text("Start Timer")
                .font(.system(size: 21, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 320, height: 70, alignment: .center)
                .background(Color.green)
                .cornerRadius(17)
        }

    }
}

extension ConfigView {
    func setUpTimer() -> TLTimer {
        return TLTimer(green: (gM, gS), yellow: (yM, yS))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
            
            
    }
}



