//
//  DataStore.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let shared = DataStore()
    
    private override init() {
        print("Data Object initialized")
        
        mainBoardImage = [#imageLiteral(resourceName: "SampleImage")]
        mainBoardText = ["Sample"]
        subBoardImage = ["Sample":[#imageLiteral(resourceName: "SampleImage"), #imageLiteral(resourceName: "SampleImage")],"Sample 2":[#imageLiteral(resourceName: "SampleImage"), #imageLiteral(resourceName: "SampleImage"),#imageLiteral(resourceName: "SampleImage")],"Sample 3":[#imageLiteral(resourceName: "SampleImage"), #imageLiteral(resourceName: "SampleImage"),#imageLiteral(resourceName: "SampleImage"),#imageLiteral(resourceName: "SampleImage")] ]
        
        mainBoardImage.append(#imageLiteral(resourceName: "SampleImage"))
        mainBoardText.append("Sample 2")
        
        mainBoardImage.append(#imageLiteral(resourceName: "SampleImage"))
        mainBoardText.append("Sample 3")

    }
    var subBoardPageTitle = ""
    
    var isJustSample = true
    var mainBoardImage: [UIImage]
    var mainBoardText: [String]
    var subBoardImage: [String:[UIImage]]

}
