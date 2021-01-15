//
//  ContentView.swift
//  swiftuiTimer
//
//  Created by Page Kallop on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State var selectedPickerIndex = 0
    
    let availableTime = Array(1...59)
   
    var body: some View {
        NavigationView{
            VStack{
                Text("\(timerManager.secondsLeft)")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(Color.red)
                    .onTapGesture {
                        self.timerManager.start()
                    }
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                }
                if timerManager.timerMode == .initial {
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
        .environment(\.colorScheme, .dark)
        
    }
}
   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
