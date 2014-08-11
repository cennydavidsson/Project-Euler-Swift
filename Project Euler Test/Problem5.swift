//
//  Problem5.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem5: XCTestCase {

    // 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    // What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    func testProblem() {
        
        let top = 20
        let primeFactors = filter(2...top) { isPrimeNumber($0) }
        
        let primesWithPower = primeFactors.map() { pow(Float($0), floor(log(Float(top)) / log(Float($0)))) }
        let answer = Int(primesWithPower.reduce(1) { $0 * $1 })
        
        XCTAssertTrue(answer == 232_792_560)
    }
}
