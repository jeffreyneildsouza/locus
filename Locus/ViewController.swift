//
//  ViewController.swift
//  Locus
//
//  Created by Jeffrey Neil Dsouza on 2019-09-18.
//  Copyright © 2019 JeffreyNeilDsouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var lblround: UILabel!
    @IBOutlet weak var lbltarget: UILabel!
    @IBOutlet weak var lblscore: UILabel!
    
    
    
    var currentValue = 0
    var targetValue = 0
    var difference = 0
    var score = 0
    var round = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        difference = abs(currentValue - targetValue) //difference instance variable
        var points = 100 - difference //points local variable
        
        
        let title: String //title local variable
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference == 1{
            title = "You almost had it"
            points += 50
        }else {
            title = "Not even close"
        }
        
        score += points //instance variable

        let message = "You have scored \(points) points"  //message local variable
       
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)  //alert local variable
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action) //alert local variable
            present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        score = 0
        round = 1
        updateLabels()
    }
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderValue.value = Float(currentValue)
        round = round + 1
        updateLabels()
    }
    func updateLabels(){
        lbltarget.text = String(targetValue)
        lblround.text = String(round)
        lblscore.text = String(score)
    }
}




