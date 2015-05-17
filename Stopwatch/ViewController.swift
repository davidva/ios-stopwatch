//
//  ViewController.swift
//  Stopwatch
//
//  Created by David Vilar Alcalá on 17/05/2015.
//  Copyright (c) 2015 David Vilar Alcalá. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hiddenBtn: UIBarButtonItem!
    
    var stopwatch: Stopwatch!

    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var toolbar: UIToolbar!

    @IBAction func start(sender: UIBarButtonItem) {
        stopwatch.start()
        toggleButton()
    }

    @IBAction func pause(sender: UIBarButtonItem) {
        toggleButton()
        stopwatch.pause()
    }

    @IBAction func stop(sender: UIBarButtonItem) {
        if stopwatch.isRunning() {
            toggleButton()
        }
        stopwatch.stop()
        time.text = "0"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatch = Stopwatch(tickHandler: setCounter)
        hiddenBtn = toolbar.items?.removeAtIndex(1) as? UIBarButtonItem
    }

    func setCounter(value: Int) {
        time.text = "\(value)"
    }

    private func toggleButton() {
        toolbar.items?.insert(hiddenBtn, atIndex: 0)
        hiddenBtn = toolbar.items?.removeAtIndex(1) as? UIBarButtonItem
    }
}

