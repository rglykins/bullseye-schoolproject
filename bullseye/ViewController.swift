//
//  ViewController.swift
//  bullseye
//
//  Created by Robert Lykins on 1/31/18.
//  Copyright © 2018 Robert Lykins. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    // Instance variables last for as long as the object that contains them. current value is one example
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    // A reference to the UISlider that is connected to the slider in our program. Slider now acts as an instance variable
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal,for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top:0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)        
        
    }
    
    
    
    
    
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
   
    //@IBAction allows the interface builder to see the code so it can be used with interface elements
    @IBAction func showAlert(){
        
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }
        else if difference < 5{
            title = "You almost had it!"
            
            if difference == 1{
                points += 50
            }
        }
        else if difference < 10{
            title = "Pretty good!"
        }
        else{
            title = "Not even close..."
        }

        score += points

        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = lroundf(slider.value)
    }
    
}

