//
//  MainToDoListTableViewCell.swift
//  Todo App
//
//  Created by Yok on 23/9/2564 BE.
//

import UIKit

class MainToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var doUIImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
