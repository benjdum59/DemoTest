//
//  DemoTestTests.swift
//  DemoTestTests
//
//  Created by Benjamin Dumont on 11/06/2021.
//

import XCTest
@testable import DemoTest

class HelloWorldResultTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_should_return_hello_world_when_string_is_nil() throws {
        // Arrange
        let expected = "Hello World!"
        
        // Act
        let result = HelloWorldResult(nil).result
        
        // Assert
        XCTAssertEqual(result, expected)
    }
    
    func test_should_return_hello_with_name_when_string_is_a_name() throws {
        // Arrange
        let name = "Benjamin"
        let expected = "Hello \(name)!"
        
        // Act
        let result = HelloWorldResult(name).result
        
        // Assert
        XCTAssertEqual(result, expected)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
