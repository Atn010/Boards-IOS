//
//  MainBoardTCVCTableViewCell.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class MainBoardTVCell: UITableViewCell {
    @IBOutlet weak var TableViewCell: UIView!
    @IBOutlet weak var MainBoardCellImage: UIImageView!
    
    @IBOutlet weak var MainBoardCellText: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
