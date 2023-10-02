//
//  Model.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/29.
//

import Foundation

struct SetTheTime {
    var wakeUp: Int
    var exercise: Int
    var study: Int
}

struct total {
    var wakeUpSuccesseCount: Int
    var exerciseTime: Int
    var studyTime: Int
}

struct StopWatch {
    var isStarted: Bool
    var isCompleted: Bool
    var counter: Double
    var timer: Timer
    let watchType: StopWatchType
    
    init(_ type: StopWatchType) {
        self.isStarted = false
        self.isCompleted = false
        self.counter = 0.0
        self.timer = Timer()
        self.watchType = type
    }
}

enum StopWatchType {
    case main
    case total
}
