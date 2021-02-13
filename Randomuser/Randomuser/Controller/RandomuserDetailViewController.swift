//
//  RandomuserDetailViewController.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 13/02/2021.
//

import UIKit

class RandomuserDetailViewController: UIViewController {

    // MARK: - Properties
    
    var userView: RandomuserDetailView!
    var userInfo: Results?
    
    // MARK: - View life cycle
    
    override func loadView() {
        let view = RandomuserDetailView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        (self.view as! RandomuserDetailView).userTitle.text = "\(userInfo!.name.title)"
        (self.view as! RandomuserDetailView).userLastName.text = "\(userInfo!.name.last)"
        (self.view as! RandomuserDetailView).userFirstName.text = "\(userInfo!.name.first)"
        (self.view as! RandomuserDetailView).userAge.text = "\(userInfo!.dob.age)" + " years old"
        (self.view as! RandomuserDetailView).userStreet.text = "\(userInfo!.location.street.number)" + " " + "\(userInfo!.location.street.name)"
        (self.view as! RandomuserDetailView).userCity.text = "\(userInfo!.location.city)"
        (self.view as! RandomuserDetailView).userLocation.text = "\(userInfo!.location.state)" + ", " + "\(userInfo!.location.country)"

        let imageData = NSData(contentsOf: NSURL(string: "\(userInfo!.picture.large)")! as URL)
        (self.view as! RandomuserDetailView).userImage.image = UIImage(data: imageData! as Data)
    }
}
