//
//  ResultCell.swift
//  Bark
//
//  Created by Jatin Pandey on 9/18/14.
//  Copyright (c) 2014 Jatin Pandey. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.picture.setImageWithURL(NSURL(string: "http://content7.flixster.com/movie/11/17/95/11179597_org.jpg"))
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
