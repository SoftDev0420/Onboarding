//
//  ViewController.swift
//  Q1.6
//
//  Created by SoftDev on 3/30/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var invalidateLabel: UILabel!
    
    let screenWidth = UIScreen.mainScreen().bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let delegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.vc = self
        
        codeTextField.layer.cornerRadius = 20.0
        codeTextField.layer.borderWidth = 1.0
        codeTextField.layer.borderColor = UIColorFromHex(0xd8d8d8, alpha: 1.0).CGColor
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.codeTextField.frame.height))
        codeTextField.leftView = paddingView
        codeTextField.leftViewMode = UITextFieldViewMode.Always
        
        codeTextField.delegate = self
        
        invalidateLabel.hidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard"))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
    

    @IBAction func onNext(sender: UIButton) {
        let index = sender.tag
        
        switch index {
        case 0:
            mainScrollView.setContentOffset(CGPoint(x: screenWidth, y: 0), animated: true)
            break
        case 1:
            mainScrollView.setContentOffset(CGPoint(x: screenWidth * 2, y: 0), animated: true)
            break
        case 2:
            if checkValidateCode() == true {
                mainScrollView.setContentOffset(CGPoint(x: screenWidth * 3, y: 0), animated: true)
            }
            else {
                print("InValid")
                codeTextField.layer.borderColor = UIColorFromHex(0xd0011b, alpha: 1.0).CGColor
                codeTextField.textColor = UIColorFromHex(0xd0011b, alpha: 1.0)
                invalidateLabel.hidden = false
            }
            break
        default:
            break
        }
    }

    @IBAction func onNotification(sender: UIButton) {
        let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()

    }
    
    func checkValidateCode() -> Bool {
        
        if codeTextField.text == "" {
            return false
        }
        
        let txtCode = (codeTextField.text!).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let numCode = Int(txtCode.substringFromIndex(txtCode.endIndex.advancedBy(-2)))
        let charCode = String(txtCode.characters.dropLast(2)).lowercaseString

        
        var retVal: String = ""
        for val in charCode.unicodeScalars where val.isASCII() {
            retVal += String(UInt32(val))
        }
        
        let code: Int? = Int(retVal)
        
        if code != nil {
            
            print(code)
            print(numCode)
            print(code! % 97)
            
            if(numCode != nil) {
                if code! % 97 == numCode! {
                    return true
                }
            }
        }

        return false
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.tag == 1 {
            self.codeTextField.layer.borderColor = UIColorFromHex(0xd8d8d8, alpha: 1.0).CGColor
            self.codeTextField.textColor = UIColorFromHex(0xd8d8d8, alpha: 1.0)
            invalidateLabel.hidden = true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        codeTextField.resignFirstResponder()
        return true
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}

