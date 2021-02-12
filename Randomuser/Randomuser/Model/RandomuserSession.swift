//
//  RandomuserSession.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import Foundation
import Alamofire

// MARK: - Protocol Networking and class RandomuserSession

protocol Networking {
    
    func request(with url: URL, completionHandler: @escaping (Data?, Error?, HTTPURLResponse?) -> Void)
}

final class RandomuserSession: Networking {
    
    func request(with url: URL, completionHandler: @escaping (Data?, Error?, HTTPURLResponse?) -> Void) {
        AF.request(url).responseData { (response: AFDataResponse<Data>) in
            completionHandler(response.data, response.error, response.response)
        }
    }
}
