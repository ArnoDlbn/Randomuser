//
//  RandomuserDetailView.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 13/02/2021.
//

import UIKit

class RandomuserDetailView: UIView {

    // MARK: - Properties
    
    var title: UILabel!
    var userTitle: UILabel!
    var firstName: UILabel!
    var userFirstName: UILabel!
    var lastName: UILabel!
    var userLastName: UILabel!
    var userImage: UIImageView!
    var age: UILabel!
    var userAge: UILabel!
    var street: UILabel!
    var userStreet: UILabel!
    var city: UILabel!
    var userCity: UILabel!
    var location: UILabel!
    var userLocation: UILabel!
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .right
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = .black
        title.text = "Title: "
        addSubview(title)
        
        userTitle = UILabel()
        userTitle.translatesAutoresizingMaskIntoConstraints = false
        userTitle.textAlignment = .left
        userTitle.font = UIFont.systemFont(ofSize: 20)
        userTitle.textColor = .black
        addSubview(userTitle)
        
        firstName = UILabel()
        firstName.translatesAutoresizingMaskIntoConstraints = false
        firstName.textAlignment = .right
        firstName.font = UIFont.boldSystemFont(ofSize: 20)
        firstName.textColor = .black
        firstName.text = "First name: "
        addSubview(firstName)
        
        userFirstName = UILabel()
        userFirstName.translatesAutoresizingMaskIntoConstraints = false
        userFirstName.textAlignment = .left
        userFirstName.font = UIFont.systemFont(ofSize: 20)
        addSubview(userFirstName)

        lastName = UILabel()
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.textAlignment = .right
        lastName.font = UIFont.boldSystemFont(ofSize: 20)
        lastName.textColor = .black
        lastName.text = "Last name: "
        addSubview(lastName)
        
        userLastName = UILabel()
        userLastName.translatesAutoresizingMaskIntoConstraints = false
        userLastName.textAlignment = .left
        userLastName.font = UIFont.systemFont(ofSize: 20)
        addSubview(userLastName)

        userImage = UIImageView(frame: CGRect(x:0, y:92, width:428, height:428))
        userImage.contentMode = .scaleAspectFit
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 3
        userImage.layer.cornerRadius = 10
        userImage.layer.borderColor = UIColor.black.cgColor
        addSubview(userImage)
        
        age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        age.textAlignment = .right
        age.font = UIFont.boldSystemFont(ofSize: 20)
        age.textColor = .black
        age.text = "Age: "
        addSubview(age)
        
        userAge = UILabel()
        userAge.translatesAutoresizingMaskIntoConstraints = false
        userAge.textAlignment = .left
        userAge.font = UIFont.systemFont(ofSize: 20)
        addSubview(userAge)
        
        street = UILabel()
        street.translatesAutoresizingMaskIntoConstraints = false
        street.textAlignment = .right
        street.font = UIFont.boldSystemFont(ofSize: 20)
        street.textColor = .black
        street.text = "Street: "
        addSubview(street)
        
        userStreet = UILabel()
        userStreet.translatesAutoresizingMaskIntoConstraints = false
        userStreet.textAlignment = .left
        userStreet.font = UIFont.systemFont(ofSize: 20)
        userStreet.numberOfLines = 0
        addSubview(userStreet)
        
        city = UILabel()
        city.translatesAutoresizingMaskIntoConstraints = false
        city.textAlignment = .right
        city.font = UIFont.boldSystemFont(ofSize: 20)
        city.textColor = .black
        city.text = "City: "
        addSubview(city)
        
        userCity = UILabel()
        userCity.translatesAutoresizingMaskIntoConstraints = false
        userCity.textAlignment = .left
        userCity.font = UIFont.systemFont(ofSize: 20)
        addSubview(userCity)
        
        location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.textAlignment = .right
        location.font = UIFont.boldSystemFont(ofSize: 20)
        location.textColor = .black
        location.text = "State, Country: "
        addSubview(location)
        
        userLocation = UILabel()
        userLocation.translatesAutoresizingMaskIntoConstraints = false
        userLocation.textAlignment = .left
        userLocation.font = UIFont.systemFont(ofSize: 20)
        userLocation.numberOfLines = 0
        addSubview(userLocation)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 50),
            title.trailingAnchor.constraint(equalTo: userTitle.leadingAnchor, constant: -5),

            userTitle.topAnchor.constraint(equalTo: title.topAnchor),
            userTitle.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),

            lastName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            lastName.trailingAnchor.constraint(equalTo: userLastName.leadingAnchor, constant: -5),
            
            userLastName.topAnchor.constraint(equalTo: lastName.topAnchor),
            userLastName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),

            firstName.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 10),
            firstName.trailingAnchor.constraint(equalTo: userFirstName.leadingAnchor, constant: -5),
            
            userFirstName.topAnchor.constraint(equalTo: firstName.topAnchor),
            userFirstName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),

            age.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 10),
            age.trailingAnchor.constraint(equalTo: userAge.leadingAnchor, constant: -5),
            
            userAge.topAnchor.constraint(equalTo: age.topAnchor),
            userAge.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),
            
            street.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 10),
            street.trailingAnchor.constraint(equalTo: userStreet.leadingAnchor, constant: -5),
            
            userStreet.topAnchor.constraint(equalTo: street.topAnchor),
            userStreet.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),
            userStreet.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            
            city.topAnchor.constraint(equalTo: userStreet.bottomAnchor, constant: 10),
            city.trailingAnchor.constraint(equalTo: userCity.leadingAnchor, constant: -5),
            
            userCity.topAnchor.constraint(equalTo: city.topAnchor),
            userCity.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),
            
            location.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 10),
            location.trailingAnchor.constraint(equalTo: userLocation.leadingAnchor, constant: -5),
            
            userLocation.topAnchor.constraint(equalTo: location.topAnchor),
            userLocation.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 5),
            userLocation.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
