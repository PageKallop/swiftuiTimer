//
//  ContentView.swift
//  swiftuiTimer
//
//  Created by Page Kallop on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let availableTime = Array(1...59)
   
    var body: some View {
        NavigationView{
            VStack{
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(Color.red)
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                }
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableTime.count) {
                            Text("\(self.availableTime[$0]) min")
                        }
                    }
                    .labelsHidden()
                }
            }
            .navigationTitle("Timer")
            
        }
        
    }
}
   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
