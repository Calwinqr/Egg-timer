//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft":360, "Medium":420, "Hard":720]
    var seconds:Int=60
    var timer=Timer()
    var totalTime=60

    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    @IBAction func eggSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress=0.0
        titleLable.text=sender.currentTitle!
        let hardness=sender.currentTitle!
        seconds=eggTime[hardness]!
        totalTime=seconds
        timer=Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if seconds>0{
            progressBar.progress=Float(seconds) / Float(totalTime)
            seconds -= 1
        }
        else{
            progressBar.progress=0
            titleLable.text="DONE!"
        }
    }
    
}

