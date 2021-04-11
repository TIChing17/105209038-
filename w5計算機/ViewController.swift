//
//  ViewController.swift
//  w5計算機
//
//  Created by 曾意晴 on 2021/4/7.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var sum: UILabel!
    
    var screenNumber: Double = 0
    var previosNumber: Double = 0
    var math: Bool = false
    var operation:operationType = .none
    var new = true
    
    enum operationType{
        case add
        case substract
        case multiply
        case divide
        case remainder
        case none
    }
    
    
    func correctNumber (number:Double){
        
        var endText: String
        
        if floor(number) == number{
            endText = "\(Int(number))"
        }else{
            endText = "\(number)"
        }
        
        if endText.count >= 8{
            endText = String(endText.prefix(8))
        }
        
        self.sum.text = endText
    }

  
    @IBAction func add(_ sender: UIButton) {
        if previosNumber != 0{
            noequal()
        }
        sum.text = "+"
        operation = .add
        math = true
        previosNumber = screenNumber
        new = false
    }
    
    
    @IBAction func substact(_ sender: UIButton) {
        if previosNumber != 0{
            noequal()
        }
        sum.text = "-"
        operation = .substract
        math = true
        previosNumber = screenNumber
        new = false
    }
    
    
    @IBAction func multiply(_ sender: UIButton) {
        if previosNumber != 0{
            noequal()
        }
        sum.text = "x"
        operation = .multiply
        math = true
        previosNumber = screenNumber
        new = false
    }
    
    
    @IBAction func divide(_ sender: UIButton) {
        if previosNumber != 0{
            noequal()
        }
        sum.text = "/"
        operation = .divide
        math = true
        previosNumber = screenNumber
        new = false
    }
    
    
    @IBAction func remainder(_ sender: UIButton) {
        if previosNumber != 0{
            noequal()
        }
        sum.text = "%"
        operation = .remainder
        math = true
        previosNumber = screenNumber
        new = false
    }
    
    @IBAction func dot(_ sender: UIButton) {
        if sum.text != nil{
            if new == true{
                sum.text = "0."
                new = false
            }else{
                sum.text = sum.text! + "."
            }
        }
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        if math == true{
            switch self.operation {
                case .add:
                    screenNumber = previosNumber + screenNumber
                    correctNumber(number: screenNumber)
                case .substract:
                    screenNumber = previosNumber - screenNumber
                    correctNumber(number: screenNumber)
                case .multiply:
                    screenNumber = previosNumber * screenNumber
                    correctNumber(number: screenNumber)
                case .divide:
                    screenNumber = previosNumber / screenNumber
                    correctNumber(number: screenNumber)
                case .remainder:
                    screenNumber = previosNumber .truncatingRemainder(dividingBy: screenNumber)
                    correctNumber(number: screenNumber)
                case .none:
                    sum.text = "0"
                }
            math = false
            new = true
        }
        previosNumber = 0
    }
    
    func noequal(){
        switch operation {
        case .add:
            screenNumber = previosNumber + screenNumber
            correctNumber(number: screenNumber)
        case .substract:
            screenNumber = previosNumber - screenNumber
            correctNumber(number: screenNumber)
        case .multiply:
            screenNumber = previosNumber * screenNumber
            correctNumber(number: screenNumber)
        case .divide:
            screenNumber = previosNumber / screenNumber
            correctNumber(number: screenNumber)
        case .remainder:
            screenNumber = previosNumber .truncatingRemainder(dividingBy: screenNumber)
            correctNumber(number: screenNumber)
        case .none:
            sum.text = "0"
        }
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        guard ((sum.text?.count ?? 0)<8)
        else{
            return
        }
        
        let inputNumber = sender.tag - 1
        
        if sum.text != nil{
            if new == true{
                sum.text = "\(inputNumber)"
                new = false
            }else{
                if sum.text == "0"||sum.text == "+"||sum.text == "-"||sum.text == "x"||sum.text == "/"||sum.text == "%" {
                    sum.text = "\(inputNumber)"
                }else{
                    sum.text = sum.text! + "\(inputNumber)"
                }
            }
        }
        screenNumber = Double(sum.text!) ?? 0
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        sum.text = "0"
        screenNumber = 0
        previosNumber = 0
        math = false
        operation = .none
        new = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

