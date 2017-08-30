//
//  ViewController.swift
//  CustomProgressV
//
//  Created by ivna.evecom on 2017/7/26.
//  Copyright © 2017年 ivna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressV:ProgressV!
    override func viewDidLoad() {
        super.viewDidLoad()
         progressV = ProgressV.init(frame: CGRect.init(x: 0, y: 80, width: self.view.frame.size.width, height: 80), dataArr: ["1","2","3","4","5","6"])
        self.view.addSubview(progressV)
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func lastStep(_ sender: UIButton) {
        
//       progressV.index -= 1
        progressV.index = progressV.index - 1
    }
    @IBAction func nextStep(_ sender: UIButton) {
//        progressV.index += 1
        progressV.index = progressV.index + 1 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

