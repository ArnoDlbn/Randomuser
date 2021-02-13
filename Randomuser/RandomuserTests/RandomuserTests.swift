//
//  RandomuserTests.swift
//  RandomuserTests
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import XCTest
import Alamofire
@testable import Randomuser

class RandomuserTests: XCTestCase {

    func testRequestShouldPostFailedCallbackIfError() {
        let randomuser = RandomuserService(session: AlamofireSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        randomuser.request() { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.failure = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
            wait(for: [expectation], timeout: 0.10)
    }
    
    func testRequestShouldPostFailedCallbackIfNoData() {
        let randomuser = RandomuserService(session: AlamofireSessionFake(data: nil, response: FakeResponseData.responseOK, error: nil))
       
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        randomuser.request() { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.noData = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.10)
    }
    
    func testRequestShouldPostFailedCallbackIncorrectResponse() {
        let randomuser = RandomuserService(session: AlamofireSessionFake(data: FakeResponseData.recipleaseCorrectData, response: FakeResponseData.responseKO, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        randomuser.request() { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.wrongResponse(statusCode: 500) = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.10)
    }
    
    func testRequestShouldPostFailedCallbackIncorrectData() {
        let randomuser = RandomuserService(session: AlamofireSessionFake(data: FakeResponseData.IncorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        randomuser.request() { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.errorDecode = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.10)
    }
    
    func testRequestShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let randomuser = RandomuserService(session: AlamofireSessionFake(data: FakeResponseData.recipleaseCorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        randomuser.request() { (data, error) in
            let userFirstName: String = "Charles"
            let age: Int = 62
            
            XCTAssertEqual(userFirstName, data?.results[0].name.first)
            XCTAssertEqual(age, data?.results[0].dob.age)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.10)
    }
}
