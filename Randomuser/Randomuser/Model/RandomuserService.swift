//
//  RandomuserService.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import Foundation
import Alamofire

class RandomuserService {
    
    // MARK: - Properties
    
    private let session: Networking
    
    // MARK: - Initialization
    
    init(session: Networking = RandomuserSession()) {
        self.session = session
    }
    
    // MARK: - Methods

    func request(completionHandler: @escaping (RandomuserData?, Error?) -> Void) {
        
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else { return }

        session.request(with: url) { data, error, response in
            if error != nil {
                return completionHandler(nil, ErrorCases.failure)
            }

            guard let r = response, r.statusCode == 200 else {
                return completionHandler(nil, ErrorCases.wrongResponse(statusCode: response!.statusCode))
            }

            guard let d = data else {
                return completionHandler(nil, ErrorCases.noData)
            }

            do {
                let result = try JSONDecoder().decode(RandomuserData.self, from: d)
                return completionHandler(result, nil)
            } catch {
                return completionHandler(nil, ErrorCases.errorDecode)
            }
        }
    }
    
}
