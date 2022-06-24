//
//  ChallengeDetailsViewController.swift
//  fireworks
//
//  Created by Micaela Cavallo on 20/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class ChallengeDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    var challenge : Challenge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 30
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //further modify style (font) etc. 
        navigationController?.navigationBar.tintColor = UIColor.white
        if challenge != nil {
            imageView.image = UIImage(named: challenge.headerImageName)
            textView.text = challenge.description
            textView.textColor = UIColor.systemGray
            
        } else {
            textView.text = "technical errors"
        }
    }
    
    @IBAction func goToQuickStart(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuickStartVC") as? QuickStartViewController
        {
            if challenge != nil {
                vc.quickstartChallenge = challenge
            } else {
                print("ERROR: Our challenge is not set")
            }
            
         navigationController?.pushViewController(vc, animated: true)
        }

    }
    
}
