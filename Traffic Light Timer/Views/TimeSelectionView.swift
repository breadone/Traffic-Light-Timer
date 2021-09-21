//
//  TimeSelectionView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimeSelectionView: View {
    var title: String
    var titleColour: Color = .black
    @Binding var minute: Int
    @Binding var second: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(titleColour)
                .padding(.leading, 25)
                .padding(.trailing, 25)
            Spacer()
                CustomPicker(title: "Minute", lBound: 0, uBound: 20, selection: $minute)
                
                CustomPicker(title: "Second", lBound: 0, uBound: 59, selection: $second)

            .padding(.trailing, 50)
        }
    }
}

fileprivate struct CustomPicker: View {
    var title: String
    var lBound, uBound: Int
    @Binding var selection: Int
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(lBound ..< uBound + 1) { num in
                 Text("\(num)")
                    .font(.system(size: 20, weight: .regular, design: .rounded))
            }
        }
        .pickerStyle(.wheel)
        .frame(width: 80, height: 130)
        .compositingGroup()
        .clipped()
        
    }
}
