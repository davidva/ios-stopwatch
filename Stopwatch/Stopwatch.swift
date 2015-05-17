//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by David Vilar Alcalá on 17/05/2015.
//  Copyright (c) 2015 David Vilar Alcalá. All rights reserved.
//

import Foundation

class Stopwatch: NSObject {
    private var timer = NSTimer()
    private var running = false
    private var counter = 0
    private var tickHandler: (Int) -> ()
    
    init(tickHandler: (Int) -> ()) {
        self.tickHandler = tickHandler
    }

    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        running = true
    }
    
    func stop() {
        timer.invalidate()
        counter = 0
        running = false
    }
    
    func pause() {
        timer.invalidate()
        running = false
    }
    
    func isRunning() -> Bool {
        return running
    }
    
    func tick() {
        counter++
        tickHandler(counter)
    }
}