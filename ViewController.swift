//
//  ViewController.swift
//  Timer with slider
//
//  Created by Furkan Ceylan on 6.06.2022.
//

import UIKit

class ViewController: UIViewController {

    let slider = UISlider()
    let resultLabel = UILabel()
    var timer : Timer?
    var counter = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        slider.minimumValue = 10.0
        slider.maximumValue = 30.0
        slider.minimumValueImage = UIImage(systemName: "deskclock")
        slider.value = 1.0
        slider.minimumTrackTintColor = .systemYellow
        slider.maximumTrackTintColor = .systemBlue
        slider.thumbTintColor = .systemGray
        slider.frame = CGRect(x: width * 0.5 - (width * 0.9 / 2), y: height * 0.1 - 5, width: width * 0.9, height: 30)
        slider.addTarget(self, action: #selector(ViewController.sliderDidSlidee), for: UIControl.Event.valueChanged)
        view.addSubview(slider)
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 2
        resultLabel.textColor = .black
        resultLabel.frame = CGRect(x: width * 0.5 - (width * 0.8 / 2), y: height * 0.5 - 27 , width: width * 0.8, height: 54)
        view.addSubview(resultLabel)
        
        counter = Int(slider.value)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

    }

    @objc func sliderDidSlidee(){
        counter = Int(slider.value)
        resultLabel.text = "Selected Second \(counter)"
    }
    
    @objc func runTimedCode(slid : UISlider){
        resultLabel.text = "Time : \(counter)"
        counter -= 1
        if counter < 0{
            timer?.invalidate()
        }
    }

}

