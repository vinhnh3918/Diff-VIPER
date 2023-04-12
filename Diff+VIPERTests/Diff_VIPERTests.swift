//
//  Diff_VIPERTests.swift
//  Diff+VIPERTests
//
//  Created by mac on 12/04/2023.
//

import XCTest
@testable import Diff_VIPER

final class Diff_VIPERTests: XCTestCase {

    var mockAPI: MockListCoinAPI!
    var interactor: ListCoinInteractor!
    
    override func setUp() {
        super.setUp()
        mockAPI = MockListCoinAPI()
        interactor = ListCoinInteractor(api: mockAPI)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchCoinsSuccess() {
            let coins = [Coin(id: "bitcoin", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "18637837.0000000000000000", maxSupply: "21000000.0000000000000000", marketCapUsd: "1116988576404.8532816804561904", volumeUsd24Hr: "50099954670.2207748320108260", priceUsd: "59831.1798898983374487", changePercent24Hr: "-2.5332439321352463", vwap24Hr: "61606.4605186830308829")]
            mockAPI.coins = coins
            
            let expectation = self.expectation(description: "coins")
            interactor.fetchCoins(limit: 15) { result in
                switch result {
                case .success(let fetchedCoins):
                    XCTAssertEqual(coins, fetchedCoins)
                case .failure:
                    XCTFail("Should not return error")
                }
                expectation.fulfill()
            }
            
            waitForExpectations(timeout: 1, handler: nil)
        }
        
        func testFetchCoinsFailure() {
            let error = NSError(domain: "test", code: 0, userInfo: nil)
            mockAPI.error = error
            
            let expectation = self.expectation(description: "error")
            interactor.fetchCoins(limit: 15) { result in
                switch result {
                case .success:
                    XCTFail("Should not return coins")
                case .failure(let fetchedError):
                    XCTAssertEqual(error.localizedDescription, fetchedError.localizedDescription)
                }
                expectation.fulfill()
            }
            
            waitForExpectations(timeout: 1, handler: nil)
        }

}
