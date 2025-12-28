//
//  ViewController.swift
//  Timer
//
//  Created by Baran on 28.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerContainer: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer?
    var counter = 0
    var isRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playButtonTiklandi(_ sender: Any) {
        if isRunning {
           stopTimer()
        } else{
            startTimer()
        }
    }
    
    @IBAction func resetButtonTiklandi(_ sender: Any) {
       stopTimer()
       counter = 0
       timeLabel.text = "00:00"
    }
    
    func startTimer(){
        isRunning = true
        
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            
            self.counter += 1
            let minutes = self.counter / 60
            let seconds = self.counter % 60
            self.timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
            
        }
    }
    
    
    func stopTimer(){
        
        timer?.invalidate()
        timer = nil
        isRunning = false
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        
    }
    

}

