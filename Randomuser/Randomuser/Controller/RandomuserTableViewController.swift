//
//  RandomuserTableViewController.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import UIKit

class RandomuserTableViewController: UITableViewController {

    // MARK: - Properties
    
    let service = RandomuserService()
    var randomusers = [Results]()
    var data: RandomuserData?
    
    let randomuserTableViewCell = "randomuserTableViewCell"
    var searchActivity = UIActivityIndicatorView()

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "USERS"
        
        self.view.addSubview(searchActivity)
        NSLayoutConstraint.activate([
            searchActivity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            searchActivity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

        activityIndicator(activityIndicator: searchActivity, showActivityIndicator: true)
        service.request(completionHandler: { (users, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.data = users
                    self.randomusers = users!.results
                } else {
                    self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
                }
                self.tableView.reloadData()
                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
            }
        })
//        tableView.register(RandomuserTableViewCell.self, forCellReuseIdentifier: randomuserTableViewCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: randomuserTableViewCell)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomusers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: randomuserTableViewCell, for: indexPath) as! RandomuserTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: randomuserTableViewCell, for: indexPath)
        let user = randomusers[indexPath.row]
//        cell.userFirstName.text = user.picture.medium
//        cell.userLastName.text = user.name.last
        cell.textLabel?.text = user.name.title + "  " + user.name.first + " " + user.name.last
        
        let imageData = NSData(contentsOf: NSURL(string: "\(user.picture.large)")! as URL)
        cell.imageView?.image = UIImage(data: imageData! as Data)
//        let imageData = NSData(contentsOf: NSURL(string: "\(user.picture.medium)")! as URL)
//        cell.userImage.image = UIImage(data: imageData! as Data)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userInfo = randomusers[indexPath.row]
        let randomuserDetailViewController = RandomuserDetailViewController()
        randomuserDetailViewController.userInfo = userInfo
        self.navigationController?.pushViewController(randomuserDetailViewController, animated: true)
    }
}
