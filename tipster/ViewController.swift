//
//  ViewController.swift
//  tipster
//
//  Created by Ryan Zhang on 7/29/17.
//  Copyright © 2017 Ryan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard;
        let defaultTip = defaults.integer(forKey: "default_tip");
        
        tipSlider.value = Float(defaultTip);
        tipPercentLabel.text = String(format: "%d%%", defaultTip);
        calcTip(tipPercent: defaultTip);
    }
    
    func calcTip(tipPercent:Int) {
        let bill:Double = Double(billField.text!) ?? 0;
        let tip:Double = bill * Double(tipPercent) / 100;
        let total:Double = bill + tip;
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
    }

    @IBAction func calculateTip(_ sender: Any) {
        let tipPercent:Int = Int(tipSlider.value);
        tipPercentLabel.text = String(format: "%d%%", tipPercent);
        calcTip(tipPercent: tipPercent);
    }
}

