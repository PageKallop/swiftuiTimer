//
//  TimerMode.swift
//  swiftuiTimer
//
//  Created by Page Kallop on 1/15/21.
//

import Foundation
//sets the conditions of timer
enum TimerMode {
    
    case running
    case paused
    case initial
}
//sets textview to display time in minuets and seconds
func secondsToMinuetsAndSeconds(seconds: Int) -> String {
    let minuets = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuetsStamp = minuets.count > 1 ? minuets : "0" + minuets
    let secondsStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuetsStamp) : \(secondsStamp)"
}
