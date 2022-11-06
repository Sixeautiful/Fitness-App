//
//  TimerView.swift
//  FirstApp
//
//  Created by Kirill Willer on 16.10.22.
//

import SwiftUI

struct TimerView: View {
    @State private var timerRemaining = 3
    @Binding var timerDome: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Text("\(timerRemaining)")
            .font(.system(size: 90, design: .rounded))
            .padding()
            .onReceive(timer) { _ in
                if self.timerRemaining > 0 {
                    self.timerRemaining -= 1
                }
                else {
                    timerDome = true
                }
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDome: .constant(false))
    }
}
