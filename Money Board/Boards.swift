//
//  Boards.swift
//  Money Board
//
//  Created by Antonius George on 11/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class Boards: NSObject, NSCoding {

    var mainBoardImage: [UIImage]?
    var mainBoardText: [String]?
    var subBoardImage: [String:[UIImage]]?
    
    init?(texts:[String],images:[UIImage],subBoards:[String:[UIImage]]){
        self.mainBoardText = texts
        self.mainBoardImage = images
        self.subBoardImage = subBoards
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mainBoardText, forKey: "mainText")
        aCoder.encode(mainBoardImage, forKey: "mainImages")
        aCoder.encode(subBoardImage, forKey: "subImages")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let mainTexts = aDecoder.decodeObject(forKey: "mainText") as! [String]
        let mainImages = aDecoder.decodeObject(forKey: "mainImages") as! [UIImage]
        let subImages = aDecoder.decodeObject(forKey: "subImages") as! [String:[UIImage]]
        
        self.init(texts: mainTexts, images: mainImages, subBoards: subImages)
    }
    
    
    
    
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("MoneyBoard")
}
