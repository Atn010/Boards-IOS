//
//  DataStore.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit
import os.log



class DataStore: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mainBoardText, forKey: "mainText")
        aCoder.encode(mainBoardImage, forKey: "mainImages")
        aCoder.encode(subBoardImage, forKey: "subImages")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.mainBoardText = aDecoder.decodeObject(forKey: "mainText") as! [String]
        self.mainBoardImage = aDecoder.decodeObject(forKey: "mainImages") as! [UIImage]
        self.subBoardImage = aDecoder.decodeObject(forKey: "subImages") as! [String:[UIImage]]
    }
    
    
    static let shared = DataStore()
 /*
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("MoneyBoard")

    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mainBoardText, forKey: PropertyKey.mainBoardText)
        aCoder.encode(mainBoardImage, forKey: PropertyKey.mainBoardImage)
        aCoder.encode(subBoardImage, forKey: PropertyKey.subBoardImage)
    
    }
    
    
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let mainBoardText = aDecoder.decodeObject(forKey: PropertyKey.mainBoardText) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let mainBoardImage = aDecoder.decodeObject(forKey: PropertyKey.mainBoardImage) as? UIImage
        
        let subBoardImage = aDecoder.decodeObject(forKey: PropertyKey.subBoardImage) as? [UIImage]
        
        // Must call designated initializer.
        
        self.mainBoardText.append(mainBoardText)
        self.mainBoardImage.append(mainBoardImage!)
        for images in subBoardImage! {
            self.subBoardImage.updateValue([images], forKey: mainBoardText)
        }
        
        
    }
    
    
    
     func saveBoard() {
        let isSuccessfulSave =
            NSKeyedArchiver.archiveRootObject(DataStore, toFile: MoneyBoard.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    
    
    private func loadBoard() {
        NSKeyedUnarchiver.unarchiveObject(withFile: MoneyBoard.ArchiveURL.path)
    }
    

    
    struct PropertyKey {
        static let mainBoardText = "mainBoardText"
        static let mainBoardImage = "mainBoardImage"
        static let subBoardImage = "subBoardImage"
    }
    */
    
    
    

    
    private override init() {
        print("Data Object initialized")
        
        
        
            mainBoardImage = [#imageLiteral(resourceName: "SampleImage")]
            mainBoardText = ["Sample"]
            subBoardImage = ["Sample":[#imageLiteral(resourceName: "SampleImage"), #imageLiteral(resourceName: "SampleImage")]]


    }
    var subBoardPageTitle = ""
    
    var newImage = false
    

        var mainBoardImage: [UIImage]
        var mainBoardText: [String]
        var subBoardImage: [String:[UIImage]]
    
    

    
    
    func subBoardImageUpdater(_ subBoardKey:String, newSubBoardImage:UIImage){
        print("Moving Item to an Array")
        //var images = NSObject.dictionaryWithValues(forKeys: [subBoardKey]) as? [UIImage]
        var images = subBoardImage[subBoardKey]
        
        print("Adding new item to array")
        images?.append(newSubBoardImage)
        print("Updating value of subboard")
        subBoardImage.updateValue(images!, forKey: subBoardKey)
    }
    
    func saveBoard(){
        
    }
    
    func loadBoard() -> Bool{
        mainBoardImage.removeAll()
        mainBoardText.removeAll()
        subBoardImage.removeAll()
        return false
    }

}
