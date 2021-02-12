//
//  ErrorCases.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import Foundation

// enumeration to manage errors
enum ErrorCases: Swift.Error {
    case noData
    case wrongResponse(statusCode: Int?)
    case failure
    case errorDecode
}
