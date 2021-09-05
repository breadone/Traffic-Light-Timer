//
//  ContentView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct ConfigView: View {
    @StateObject var timer = Timer()
    
    @State private var gTime = 0
    @State private var yTime = 0
    @State private var rTime = 0 {
        didSet {
            
        }
    }
    
    var body: some View {
        HStack {
            NumRangePicker(name: "Green Time", lBound: 0, uBound: 300, selection: $gTime)
            NumRangePicker(name: "Yellow Time", lBound: 0, uBound: 300, selection: $yTime)
            NumRangePicker(name: "Red Time", lBound: 0, uBound: 300, selection: $rTime)
        }
    }
    
    func addIntToDate(_ num: Int) -> Date {
        return Date().addingTimeInterval(Double(num))
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



