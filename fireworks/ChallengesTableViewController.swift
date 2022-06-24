////
////  challengesTableViewController.swift
////  fireworks
////
////  Created by Terrence Gillespie on 17/11/19.
////  Copyright © 2019 Terrence Gillespie. All rights reserved.
////
//
//import UIKit
//
//class ChallengesTableViewController: UITableViewController {
//    
//    var challenges : Array<Dictionary<String,String>> = allChallenges
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.reloadData()
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return challenges.count
//    }
//   
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell") as! ChallengeTableViewCell
//        let challenge = challenges[indexPath.row]
//        cell.challengeTitleLabel.text = challenge["number"]!.uppercased()
//        cell.titleLabel.text = challenge["name"]
//        cell.bodyLabel.text = challenge["description"]
//        cell.iconImageView.image = UIImage(named: challenge["icon"]!)
//        return cell
//    }
//       
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "ShowSegue", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        print("it works")
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//}
