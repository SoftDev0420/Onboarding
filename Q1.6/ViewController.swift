//
//  ViewController.swift
//  Q1.6
//
//  Created by SoftDev on 3/30/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    let screenWidth = UIScreen.mainScreen().bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    @IBAction func onNext(sender: UIButton) {
//        let index = sender.tag
//        
//        switch index {
//        case 0:
//            mainScrollView.setContentOffset(CGPoint(x: screenWidth, y: 0), animated: true)
//            break
//        default:
//            break
//        }
    }
}

