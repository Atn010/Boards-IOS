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
    }
    
    var mainBoardImage: [UIImage]
    var mainBoardText: [String]
    var subBoardImage: [String:UIImage]

}
