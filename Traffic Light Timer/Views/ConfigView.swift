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
    @State private var redTime = Minute()
    
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
                
                TimeSelectionView(title: "Red Time",
                                  titleColour: .red,
                                  minute: $redTime.minute,
                                  second: $redTime.second)
                
                Spacer()
                StartButton.padding()
                Spacer()
            }
            .navigationTitle("Traffic Light Timer")
        }
    }
    
    var StartButton: some View {
        NavigationLink(destination: TimerView(timer: setUpTimer())) {
            Text("Start Timer")
                .bold()
                .foregroundColor(.white)
                .frame(width: 330, height: 70, alignment: .center)
                .background(Color.green)
                .cornerRadius(17)
        }
    }
}

extension ConfigView {
    
    func setUpTimer() -> TLTimer {
        
        return TLTimer(g: greenTime.totalSeconds,
                       y: yellowTime.totalSeconds,
                       r: redTime.totalSeconds)
    }
    
}



struct NumRangePicker: View {
    let name: String
    var lBound: Int
    var uBound: Int
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Text(name)
            Picker(name, selection: $selection) {
                ForEach(lBound ..< uBound + 1) { num in
                    Text("\(num)")
                }
            }
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100, height: 130, alignment: .bottom)
            .clipped()
        }
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}



