//
//  ViewController.swift
//  TipCalculator
//
//  Created by sky on 2016/7/11.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var tiponeslider: UISlider!
    @IBAction func tiponeSlider(_ sender: AnyObject) {
        if inputField.text != "" {
            calculatorAfterTip()
        self.view.endEditing(true)
        }
    }
    
    @IBOutlet weak var tiptwoslider: UISlider!
    @IBAction func tiptwoSlider(_ sender: AnyObject) {
        if inputField.text != "" {
            calculatorAfterTiptwo()

        self.view.endEditing(true)
        }
    }
    
    @IBOutlet weak var countpeople: UISlider!
    @IBAction func countPeople(_ sender: AnyObject) {
        if inputField.text != "" {
        totalBill()
        }
    }
    @IBOutlet weak var updatePercentage: UILabel!
    @IBOutlet weak var afterTipLabel: UILabel!
    @IBOutlet weak var yourTipLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var totalpeopleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func calculatorAfterTip()  {
        
        afterTipLabel.text = inputField.text
        let inputmoney = Int(inputField.text!)
        let zerotenslider = String(format: "%.0f", tiponeslider.value)
        let count = Float((inputmoney! * Int(zerotenslider)!/100) + inputmoney!)
        let tipcount = Float(inputmoney! * Int(zerotenslider)!/100)
        let tipValue = String(format: "%.0f", count)
        
        yourTipLabel.text = String(format: "%.0f", tipcount)
        updatePercentage.text = zerotenslider
        afterTipLabel.text = tipValue
        totalBillLabel.text = tipValue
    }

    
    func calculatorAfterTiptwo(){ //15-25%slider
        
        let  inputmoney = Int(inputField.text!)
        let  twentyfiveSlider = Int(tiptwoslider.value)
        let count = Float((inputmoney! * twentyfiveSlider/100) + inputmoney!)
        let tipcount = Float(inputmoney! * twentyfiveSlider/100)
        let tipValue = String(format: "%.0f", count)
        
        yourTipLabel.text = String(format: "%.0f", tipcount)
        updatePercentage.text = String(twentyfiveSlider)
        afterTipLabel.text = tipValue
        totalBillLabel.text = tipValue
        
    }
    
    func totalBill(){ //自己含小費的帳單總額
        totalpeopleLabel.text = "\(Int((countpeople?.value)!))"
        let afterTip = Int(afterTipLabel.text!)
        let countPeople = Int(countpeople.value)
        //let updatePercent = Int(updatePercentage.text!)
        let inputmoney = Int(inputField.text!)
        let count = Float((afterTip! / countPeople) - (inputmoney! / countPeople))
        let couttip = Float((afterTip! / countPeople))
        yourTipLabel.text = String(format: "%.0f", count)
        totalBillLabel.text = String(format: "%.0f", couttip)
    }
}

