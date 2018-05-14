//
//  DataStore.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit
import os.log



class DataStore: NSObject{
    static let shared = DataStore()
    private override init() {
        print("Data Object initialized")
        mainBoardText = []
        mainBoardImage = []
        subBoardImage = [:]

    }
    var subBoardPageTitle = ""
    

        var mainBoardImage: [UIImage]
        var mainBoardText: [String]
        var subBoardImage: [String:[UIImage]]
    
    
    func subBoardImageUpdater(_ subBoardKey:String, newSubBoardImage:UIImage){
        print("Moving Item to an Array")
        var images = subBoardImage[subBoardKey]
        
        print("Adding new item to array")
        images?.append(newSubBoardImage)
        print("Updating value of subboard")
        subBoardImage.updateValue(images!, forKey: subBoardKey)
    }
    
    
    
    func saveBoard() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(Boards.init(texts: mainBoardText, images: mainBoardImage, subBoards: subBoardImage)!, toFile: Boards.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("MoneyBoard successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save MoneyBoard...", log: OSLog.default, type: .error)
        }
    }
    
    
    
    

    func loadBoard() {
        
        print("Removing Old Items")
        
        
        print("Attempting to load Object")
    

            if let responseObject = NSKeyedUnarchiver.unarchiveObject(withFile: Boards.ArchiveURL.path) as? Boards{
            self.mainBoardImage.removeAll()
            self.mainBoardText.removeAll()
            self.subBoardImage.removeAll()
            
            print("Showing Item")
            //print(responseObject.mainBoardText![0])
            
            print("Replacing Item")
            self.mainBoardImage = responseObject.mainBoardImage!
            self.mainBoardText = responseObject.mainBoardText!
            self.subBoardImage = responseObject.subBoardImage!
            
            print("Successfully loaded")
        }else{
            print("Failed to Load")
        }
       
        
    }
        
}
