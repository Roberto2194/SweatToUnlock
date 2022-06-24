//
//  ChallengesTableViewController2.swift
//  fireworks
//
//  Created by Micaela Cavallo on 20/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController {
    
    let cellReuseIdentifier = "cell"
    
    var challengesArray =  [Challenge]()
    
    let walking = Challenge(imageName: "walk-icon", quickImage: "quick-walk-icon", title: "first steps", description: "Just 30 minutes every day can increase cardiovascular fitness, strengthen bones, reduce excess body fat, and boost muscle power and endurance. It can also reduce your risk of developing conditions such as heart disease, type 2 diabetes, osteoporosis and some cancers.", headerImageName: "c-01-header")
    
    let running = Challenge(imageName: "run-icon", quickImage: "quick-run-icon",title: "pick up the pace", description: "Jogging or running is a popular form of physical activity. About one in five Australians try running (or jogging) at some stage in their life. Running is an appealing exercise because it doesn't cost a lot to take part and you can run at any time that suits you.", headerImageName: "c-02-header")
    
    let hiking = Challenge(imageName: "hike-icon", quickImage: "quick-hike-icon",title: "hit the hills", description: "You can burn an extra 60% more calories walking up hill than on the flat. There are so many amazing benefits to walking up hill, such as promoting health and fighting inflammation.You can also burn as many calories walking up hill as you would if you jogged on the flat for the same period of time.", headerImageName: "c-03-header")

    
    let stairs = Challenge(imageName: "stairs-icon", quickImage: "quick-stairs-icon",title: "stairs challenge", description: "Climbing stairs is one of the best exercises when it comes to pure FAT BURN, strengthening the lower body, toning the butt, thighs, calves, losing inches from those love handles and belly as well as building great abs. Along with these benefits, it is the immense good it does for your lungs and cardiovascular system.", headerImageName: "c-04-header")
    
    let cycling = Challenge(imageName: "cycle-icon", quickImage: "quick-cycle-icon",title: "life cycle", description: "Riding your bicycle regularly is one of the best ways to reduce your risk of health problems associated with a sedentary lifestyle. Cycling is a healthy, low-impact exercise that can be enjoyed by people of all ages, from young children to older adults. It is also fun, cheap and good for the environment.", headerImageName: "c-05-header")
    
    
    let interval = Challenge(imageName: "clock-icon", quickImage: "quick-clock-icon",title: "beat the clock", description: "Interval training, alternating bursts of speed with longer recovery intervals, is now considered a beneficial exercise for more than just athletes. Interval training can consist of bursts of speed for a set amount of time or for a distance.", headerImageName: "c-06-header")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Register the table view cell class and its reuse id
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customTVC")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        challengesArray.append(walking)
        challengesArray.append(running)
        challengesArray.append(hiking)
        challengesArray.append(stairs)
        challengesArray.append(cycling)
        challengesArray.append(interval)
        
        self.navigationController?.navigationBar.tintColor = .white
        
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customTVC", for: indexPath) as! CustomChallengesCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        let identifier = "custom"

        var cell: CustomChallengesCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomChallengesCell

           if cell == nil {
            tableView.register(UINib(nibName: "CustomChallengesCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomChallengesCell
             }
        
        // Configure the cell...
        // set the text from the data model
        let challenge = challengesArray[indexPath.row]
        let challengeNumber = "challenge 0\(indexPath.row + 1)"
        
        cell.descriptionLabel.text = challenge.description
        cell.iconImageView.image = UIImage(named: challenge.imageName)
        cell.titleLabel.text = challenge.title
        cell.challengeNumberLabel.text = challengeNumber.uppercased()
        
        
        return cell
    }
    
   override func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
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
