//
//  Problem1.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem1: XCTestCase {
    
    // If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
    // The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
    
    func testProblem() {
        
        let numbers = filter(0..<1_000) { $0 % 3 == 0 || $0 % 5 == 0 }
        let sum = numbers.reduce(0, +)
        
        XCTAssertTrue(sum == 233_168)
    }
}
