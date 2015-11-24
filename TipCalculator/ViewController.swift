//
//  ViewController.swift
//  TipCalculator
//  "Some Changes"
//  Created by Hien Le on 11/24/15.
//  Copyright © 2015 Hien Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField: UITextField!
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    
    let tipCal = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    func refreshUI() {
        /* In Swift you must be explicit when converting one type to another. Here you convert tipCalc.total from a Double to a String. */
        totalTextField.text = String(format: "%0.2f", tipCal.total)
        
        /* You want the tax percentage to be displayed as an Integer (i.e. 0%-10%) rather than a decimal (like 0.06). So here you multiply the value by 100. */
        taxPctSlider.value = Float(tipCal.taxPct) * 100.0

        /* Here you use string interpolation to update the label based on the tax percentage. */
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        
        /* You clear the results text view until the user taps the calculate button. */
        resultsTextView.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTapped(sender: AnyObject) {
        tipCal.total = Double((totalTextField.text! as NSString).doubleValue)
        
        let possibleTips = tipCal.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTextView.text = results
        
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCal.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    

}

