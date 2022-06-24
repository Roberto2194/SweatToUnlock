//
//  ChallengesTableViewController2.swift
//  fireworks
//
//  Created by Micaela Cavallo on 20/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class ChallengesTableViewController2: UITableViewController {
    
    let cellReuseIdentifier = "cell"
    
    var challengesArray =  [Challenge]()
    
    let walking = Challenge(imageName: "walk-icon", title: "Walking", description: "something about walking")
    let running = Challenge(imageName: "run-icon", title: "Running", description: "something about running")
    let hiking = Challenge(imageName: "hike-icon", title: "Hiking", description: "something about hiking")

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        challengesArray.append(walking)
        challengesArray.append(running)
        challengesArray.append(hiking)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return challengesArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ChallengeTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)

        // Configure the cell...
        // set the text from the data model
        let challenge = challengesArray[indexPath.row]
        cell?.textLabel?.text = challenge.title
        cell?.textLabel?.textColor = UIColor.systemIndigo
        
        cell?.imageView?.image = UIImage(named: challenge.imageName)
        cell?.textLabel?.font = UIFont(name: "Helvetica", size: 16)
        
        return cell!
    }
    
   override func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //trigger segue into another controller
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChallengeDetailsVC") as? ChallengeDetailsViewController
                   {
                    vc.challenge = challengesArray[indexPath.row]
                    navigationController?.pushViewController(vc, animated: true)
                   }
            }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
