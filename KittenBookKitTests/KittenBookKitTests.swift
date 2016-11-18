//
//  KittenBookKitTests.swift
//  KittenBookKitTests
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import XCTest
@testable import KittenBookKit

class KittenBookKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testKittensFilePath() {
        let bundle = Bundle(for: self.classForCoder)
        let path = bundle.path(forResource: "test-kittens", ofType: "json")
        XCTAssertNotNil(path)
    }

    func testLoadingKittens() {
        let bundle = Bundle(for: self.classForCoder)
        guard let path = bundle.path(forResource: "test-kittens", ofType: "json"),
            let fileURL = URL(string: path) else {
            XCTFail()
            return
        }

        let kittens = KittenWrangler.sharedInstance.loadKittens(fileURL: fileURL)
        XCTAssertGreaterThan(kittens.count, 0)
    }
    
}
