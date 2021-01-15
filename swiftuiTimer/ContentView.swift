//
//  ContentView.swift
//  swiftuiTimer
//
//  Created by Page Kallop on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    //watches state of TimeManaer
    @ObservedObject var timerManager = TimerManager()
    //creates state of Picker
    @State var selectedPickerIndex = 0
    //time array for timer
    let availableTime = Array(1...59)
   
    var body: some View {
        NavigationView{
            VStack{
                //displays user default time
                Text(secondsToMinuetsAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top, 80)
        //creates image to display pause and play
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(Color.red)
             //allows you to click image to start or pause tim
                    .onTapGesture(perform: {
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.setTimerLength(minutes: self.availableTime[self.selectedPickerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ?
                            self.timerManager.pause() :
                        self.timerManager.start()
                    })
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                        .onTapGesture(perform: {
                            self.timerManager.reset()
                        })
                }
                //creates Picker to select a time
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableTime.count) {
                            Text("\(self.availableTime[$0]) min")
                        }
                    
                    }
                    //hide selectot while counting down
                    .labelsHidden()
                }
             //creates space
                Spacer()
                
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
