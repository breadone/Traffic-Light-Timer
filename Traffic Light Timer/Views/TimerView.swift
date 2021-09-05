//
//  TimerView.swift
//  Traffic Light Timer
//
//  Created by Pradyun Setti on 5/09/21.
//

import SwiftUI

struct TimerView: View {
    @State private var BGColour: Color = .green
    @State var timer: TLTimer?
    
    
    var body: some View {
        ZStack {
            BGColour.ignoresSafeArea()
            
        }
    }
    
    var TimerText: some View {
        Text("")
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
