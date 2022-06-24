//
//  MySectionViewController.swift
//  fireworks
//
//  Created by Terry Gillespie on 19/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class MySectionViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UILabel!

    var sections : Array<Dictionary<String,String>> = allSections

     
    override func viewDidLoad() {
            super.viewDidLoad()
        
            sectionTitle.text = "test"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

