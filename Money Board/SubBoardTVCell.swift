//
//  SubBoardTVCell.swift
//  Money Board
//
//  Created by Antonius George on 09/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class SubBoardTVCell: UITableViewCell {

    
    @IBOutlet weak var SubBoardImage: UIImageView!
    
    @IBOutlet weak var tableViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
