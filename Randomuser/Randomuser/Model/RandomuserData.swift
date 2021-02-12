//
//  RandomuserData.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import Foundation

// structure to manage data
struct RandomuserData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let dob: Dob
    let picture: Picture
    let nat: String
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable{
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}

struct Dob: Decodable {
    let date: String
    let age: Int
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
