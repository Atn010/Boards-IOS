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
    
    
    
    
/*
    
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
        mainBoardText = []
        mainBoardImage = []
        subBoardImage = [:]
        
        
        
        
        

    }
    var subBoardPageTitle = ""
    //var MoneyBoard = [MoneyBoardData]()
    

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
    
    //static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //static let ArchiveURL = DocumentsDirectory.appendingPathComponent("MoneyBoard")
    
    
    func saveBoard() {
        //dataStoreObject.init(mainText: mainBoardText, mainImages: mainBoardImage, subImages: subBoardImage)
        //let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(dataStoreObject.init(mainText: mainBoardText, mainImages: mainBoardImage, subImages: subBoardImage), toFile: DataStore.ArchiveURL.path)
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(Boards.init(texts: mainBoardText, images: mainBoardImage, subBoards: subBoardImage)!, toFile: Boards.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("MoneyBoard successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save MoneyBoard...", log: OSLog.default, type: .error)
        }
    }
    
    
    
    
    func loadBoard() {
        
        print("Removing Old Items")
        
        //let object = NSKeyedUnarchiver.unarchiveObject(withFile: MoneyBoard.ArchiveURL.path)
        
        print("Attempting to load Object")
    
        do{
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
            
            //mainBoardText =  responseObject.boardText
            //mainBoardImage =  responseObject.boardImages
            //subBoardImage =  responseObject.subBoardImages
            //newImage = responseObject.notSample
            print("Successfully loaded")
        }else{
            print("Failed to Load")
        }
       
        } catch {
            print("No Database Found")
        }
    }
        
}
/*
class dataStoreObject:NSObject {
    
    var boardText:[String]
    var boardImages:[UIImage]
    var subBoardImages:[String:[UIImage]]
    var notSample:Bool

    
    
}
*/
/*
 class MoneyBoardData: NSObject, NSCoding{
 struct data {
 static let mainBoardImage = "MainBoardImage"
 static let mainBoardText = "MainBoardText"
 static let subBoardImage = "SubBoardImage"
 }
 
 var mainBoardImage: [UIImage] = []
 var mainBoardText: [String] = []
 var subBoardImage: [String:[UIImage]] = [:]
 
 init(texts:[String],images:[UIImage],subBoards:[String:[UIImage]]){
 mainBoardText = texts
 mainBoardImage = images
 subBoardImage = subBoards
 }
 
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
 
 
 
 

 static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
 static let ArchiveURL = DocumentsDirectory.appendingPathComponent("MoneyBoard")
 }
*/
