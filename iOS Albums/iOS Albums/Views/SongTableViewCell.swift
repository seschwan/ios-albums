//
//  SongTableViewCell.swift
//  iOS Albums
//
//  Created by Seschwan on 7/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var songTitleTxtField: UITextField!
    @IBOutlet weak var durationTxtField:  UITextField!
    @IBOutlet weak var addSongBtn:        UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        addSongBtn.layer.cornerRadius = addSongBtn.frame.height / 4
        
    }
    
    // Actions
    @IBAction func addSongBtnPressed(_ sender: UIButton) {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
