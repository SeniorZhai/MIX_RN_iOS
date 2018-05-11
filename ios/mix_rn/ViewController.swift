//
//  ViewController.swift
//  mix_rn
//
//  Created by zhai on 2018/5/11.
//  Copyright © 2018年 zhai. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    @IBAction func click(_ sender: Any) {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let mockData:NSDictionary = ["name":"react native"]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "App",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

