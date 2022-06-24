//
//  SectionViewController.swift
//  fireworks
//
//  Created by Terrence Gillespie on 18/11/19.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
@IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var section: [String: String]!
    var sections: [[String: String]]!
    var indexPath: IndexPath!

    
    override func viewDidLoad() {
     super.viewDidLoad()
     titleLabel.text = section["title"]
     descriptionLabel.text = section["caption"]
     bodyLabel.text = section["body"]
     coverImage.image = UIImage(named: section["image"]!)

    }

}
