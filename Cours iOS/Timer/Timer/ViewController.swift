//
//  ViewController.swift
//  Timer
//
//  Created by Dufour Sviatoslav on 03/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    var timer: Timer = Timer()
    var timeSpent: Int = 0
    var isActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTime()
        enableBtn()
    }
    
    func enableBtn(){
        playBtn.isEnabled = !isActive
        pauseBtn.isEnabled = isActive
        stopBtn.isEnabled = (isActive || (timeSpent != 0))
    }

    func updateTime(){
        timeLabel.text = String(timeSpent)
    }
    
    @IBAction func actionPlay(_ sender: Any) {
        print("Play")
        if(!isActive){
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.timeSpent += 1
                self.updateTime()
                self.enableBtn()
            })
            isActive = true
        }
    }
    
    @IBAction func actionPause(_ sender: Any) {
        timer.invalidate()
        isActive = false
        enableBtn()
    }
    
    @IBAction func actionStop(_ sender: Any) {
        timeSpent = 0
        updateTime()
        timer.invalidate()
        isActive = false
        enableBtn()
    }
}

