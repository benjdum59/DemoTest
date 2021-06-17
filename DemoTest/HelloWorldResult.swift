//
//  HelloWorldResult.swift
//  DemoTest
//
//  Created by Benjamin Dumont on 11/06/2021.
//

import Foundation

struct HelloWorldResult {
        
    let string: String?
    
    init(_ string: String?) {
        self.string = string
    }
    
    var result: String {
        "Hello \(self.string ?? "World")!"
    }
}
