//
//  AlamofireSessionFake.swift
//  RandomuserTests
//
//  Created by Arnaud Dalbin on 13/02/2021.
//

import Foundation
import Alamofire
@testable import Randomuser

class AlamofireSessionFake: Networking {
    
    // MARK: - Properties
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Swift.Error?
    
    // MARK: - Initialization
    
    init(data: Data?, response: HTTPURLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    // MARK: - Method
    
    func request(with url: URL, completionHandler: @escaping (Data?, Error?, HTTPURLResponse?) -> Void) {
        return completionHandler(data, error, response) }
}
