//
//  SettingsViewController.swift
//  tipster
//
//  Created by Ryan Zhang on 7/29/17.
//  Copyright © 2017 Ryan Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard;
        let defaultTip = defaults.integer(forKey: "default_tip");
        defaultTipField.text = String(format: "%d", defaultTip);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaultTip:Int = Int(defaultTipField.text!) ?? 15
        let defaults = UserDefaults.standard;
        defaults.set(defaultTip, forKey: "default_tip")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
