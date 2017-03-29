//
//  ViewController.swift
//  Q1.6
//
//  Created by SoftDev on 3/29/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var screenWidth = UIScreen.main.bounds.width
    
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        let index = sender.tag
        
        switch index {
        case 0:
            mainScrollView.setContentOffset(CGPoint(x: screenWidth, y: 0), animated: true)
            break
        default:
            break
        }
    }

}

