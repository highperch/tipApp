//
//  ViewController.swift
//  tipApp
//
//  Created by Justin Peng on 12/27/15.
//  Copyright © 2015 Justin Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipCaption: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalCaption: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var Divider: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$10.00"
        Divider.alpha = 0
        tipCaption.alpha = 0
        tipLabel.alpha = 0
        totalCaption.alpha = 0
        totalLabel.alpha = 0
        tipControl.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.1, 0.15, 0.2]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func ShowTipTotal(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
        self.Divider.alpha = 1
        self.tipControl.alpha = 1
        self.tipCaption.alpha = 1
        self.tipLabel.alpha = 1
        self.totalCaption.alpha = 1
        self.totalLabel.alpha = 1
        })

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

