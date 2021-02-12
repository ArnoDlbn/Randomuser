//
//  RandomuserTableViewController.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import UIKit

class RandomuserTableViewController: UITableViewController {

    let service = RandomuserService()
    var randomusers = [Results]()
    var data: RandomuserData?
    
    let randomuserTableViewCell = "randomuserTableViewCell"
    let searchActivity = UIActivityIndicatorView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator(activityIndicator: searchActivity, showActivityIndicator: true)
        service.request(completionHandler: { (users, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.data = users
                    self.randomusers = users!.results
                    print("\(self.randomusers[0].name.first)")
                } else {
                    self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
                    print("\(error)")
                }
                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
            }
        })
        tableView.register(RandomuserTableViewCell.self, forCellReuseIdentifier: randomuserTableViewCell)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomusers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: randomuserTableViewCell, for: indexPath) as! RandomuserTableViewCell
        let user = randomusers[indexPath.row]
        cell.userFirstName.text = user.name.first
        cell.userLastName.text = user.name.last
        
//        if let urlString = user.picture.thumbnail,
//           let url = URL(string: urlString),
//           let data = try? Data(contentsOf: url) {
//            cell.userImage = UIImage(data: data)
//        }
        
        let imageData = NSData(contentsOf: NSURL(string: "\(user.picture.thumbnail)")! as URL)
        cell.userImage = UIImageView(image: UIImage(data: imageData! as Data))
        
        return cell
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
