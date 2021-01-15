//
//  TimerManager.swift
//  swiftuiTimer
//
//  Created by Page Kallop on 1/15/21.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    //create observable objects for TimerMode
    @Published var timerMode: TimerMode = .initial
    //create observable object for user defaults
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    
    var timer = Timer()
    //remembers users last input
    func setTimerLength(minutes: Int){
        let defaults = UserDefaults.standard
        defaults.setValue(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
    //creates start timer method
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    //creates reset timer method
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    //creates pause timer method
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
}
