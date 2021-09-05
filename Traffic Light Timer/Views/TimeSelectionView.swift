//
//  TimeSelectionView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimeSelectionView: View {
    var title: String
    @Binding var minute: Int
    @Binding var second: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .bold, design: .default))
                .padding(.leading, 25)
                .padding(.trailing, 25)
            Spacer()
            HStack(alignment: .center) {
                quickpick(title: "Minute", lBound: 0, uBound: 10, selection: $minute)
                
                quickpick(title: "Second", lBound: 0, uBound: 59,selection: $second)
            }
            .padding(.trailing, 50)
        }
    }
}

fileprivate struct quickpick: View {
    var title: String
    var lBound, uBound: Int
    @Binding var selection: Int
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(lBound ..< uBound + 1) { num in
                 Text("\(num)")
            }
        }
        .frame(width: 80, height: 130)
        .clipped()
    }
}
