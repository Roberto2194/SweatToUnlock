//
//  CustomChallengesCell.swift
//  fireworks
//
//  Created by Micaela Cavallo on 20/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class CustomChallengesCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var challengeNumberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
