//
//  FakeResponseData.swift
//  RandomuserTests
//
//  Created by Arnaud Dalbin on 13/02/2021.
//

import Foundation

class FakeResponseData {
    
    // MARK: - Data
    
    static var recipleaseCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Randomuser", withExtension: "json")!
        return try? Data(contentsOf: url)
    }
    
    static let IncorrectData = "erreur".data(using: .utf8)
    
    // MARK: - Response
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    // MARK: - Error
    
    class ServiceError: Error {}
    static let error = ServiceError()
}
