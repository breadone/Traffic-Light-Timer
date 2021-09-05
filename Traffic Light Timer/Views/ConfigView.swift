//
//  ContentView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct ConfigView: View {
    
    @State private var gTime = Minute()
    @State private var yTime = Minute()
    @State private var rTime = Minute()
    
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
//                    Spacer()
//                    Text("Minutes")
//                        .padding(.trailing)
//                    Text("Seconds")
//                }
//                .padding(.trailing, 60)
                TimeSelectionView(title: "Green Time", minute: $gTime.minute, second: $gTime.second)
                
                TimeSelectionView(title: "Yellow Time", minute: $yTime.minute, second: $yTime.second)
                
                TimeSelectionView(title: "Red Time", minute: $rTime.minute, second: $rTime.second)
                
                Spacer()
                StartButton.padding()
                Spacer()
            }
            .navigationTitle("Traffic Light Timer")
        }
    }
    
    var StartButton: some View {
        Button(action: {}) {
           Text("Start Timer")
            .bold()
            .foregroundColor(.white)
               .frame(width: 330, height: 70, alignment: .center)
                .background(Color.green)
            .cornerRadius(7)
       }
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



