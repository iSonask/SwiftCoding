//
//  ViewController.swift
//  testnm
//
//  Created by Steven Curtis on 10/09/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit
import NetworkLibrary


class ViewController: UIViewController {

    private var httpManager: AnyNetworkManager<URLSession>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.httpManager = AnyNetworkManager(manager: NetworkManager(session: URLSession.shared))
        
        self.httpManager?.fetch(url: URL(string: "https://jsonplaceholder.typicode.com/posts/1")!, method: .put, completionBlock: { result in
            
            switch result {
            case .failure(let error):
                print ("error \(error)")
            case .success(let data):
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                    if let jsonDict = jsonObject as? NSDictionary {
                        print (jsonDict)
                    }
                    if let jsonArray = jsonObject as? NSArray {
                        print (jsonArray)
                    }
                } catch {
                    // error handling
                }
            }
        })
    }
}

