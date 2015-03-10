//
//  ViewController.swift
//  testing
//
//  Created by Anil on 10/03/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataForNextTable()
    }
}

func getDataForNextTable(){
    
    let url : String = "http://staging.api.cheapeat.com.au/search?lat=-34.4232722&lng=150.8865837"

    let remoteUrl:NSURL? = NSURL(string: url)
    let urlString:String = "\(remoteUrl)"
    if let actualRemoteUrl = remoteUrl {
        
        let fileData:NSData? = NSData(contentsOfURL: actualRemoteUrl)
        if let actualFileData = fileData {
            
            var error: NSError?
            let json : JSON = JSON(data: actualFileData, options: nil, error: &error) as JSON
            if let error = error {
                
                println("An error occurred \(error)")
                
            }else {
//                println(json)
                 for i  in 0..<json.count{
                    var trading = json[i]["restaurants"][0]["trading_hours"].stringValue
                    println(trading)
                }
            }
        }
    }
}