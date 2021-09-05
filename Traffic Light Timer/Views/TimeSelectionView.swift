//
//  TimeSelectionView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimeSelectionView: View {
    @Binding var minute: Int
    @Binding var second: Int
    
    var body: some View {
        HStack {
            Picker("Minute", selection: $minute) {
                ForEach(0 ..< 10 ) { num in
                     Text("\(num)")
                }
            }
        }
    }
}
