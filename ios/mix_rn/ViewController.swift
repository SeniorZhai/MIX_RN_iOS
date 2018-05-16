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
        let path = Bundle.main.path(forResource: "main", ofType: "jsbundle")
        if path != nil {
            let mockData:NSDictionary = ["name":"react native"]
            let rootView = RCTRootView(
                bundleURL:  URL(fileURLWithPath: path!),
                moduleName: "App",
                initialProperties: mockData as [NSObject : AnyObject],
                launchOptions: nil
            )
            let vc = UIViewController()
            vc.view = rootView
            self.present(vc, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
        let destinationFileUrl = documentsUrl.appendingPathComponent("index2.zip")
        
        //Create URL to the source file you want to download
        let fileURL = URL(string: "https://raw.githubusercontent.com/SeniorZhai/MIX_RN/master/static/1/index.zip")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let request = URLRequest(url:fileURL!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
            
                    
                        let mockData:NSDictionary = ["name":"react native"]
                        let rootView = RCTRootView(
                            bundleURL:  destinationFileUrl,
                            moduleName: "APP",
                            initialProperties: mockData as [NSObject : AnyObject],
                            launchOptions: nil
                        )
                        let vc = UIViewController()
                        vc.view = rootView
                        self.present(vc, animated: true, completion: nil)
                    
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
            }
        }
         task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

