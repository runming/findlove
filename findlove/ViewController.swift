//
//  ViewController.swift
//  findlove
//
//  Created by 华润明 on 15/3/8.
//  Copyright (c) 2015年 华润明. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var hasproperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    @IBOutlet weak var heightnumber: UISlider!
    
    @IBOutlet weak var height: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func heightchanged(sender: AnyObject) {
        // round the step to int
        var slider = sender as UISlider
        var i = Int(slider.value)
        slider.value = Float(i);
        height.text = "\(i) 厘米"
    }
    
    @IBAction func oktapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅": "白富美"
        
        let hasPropertyText = hasproperty.on ? "有房": "没房"
        
        // get the age
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        let age = components?.year
        
        result.text = "\(name.text), \(age!)岁, \(genderText), 身高\(height.text!), \(hasPropertyText), 求交往！"
    }
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

