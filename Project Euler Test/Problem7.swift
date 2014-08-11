//
//  Problem7.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem7: XCTestCase {

    //By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
    // What is the 10 001st prime number?
    func testProblem() {
        
        var highestPrimes = 0, primeCounter = 0, i = 0
        while primeCounter < 10_001 {
            if isPrimeNumber(i) { highestPrimes = i; primeCounter++ }
            i++
        }
        XCTAssertTrue(highestPrimes == 104_743)
    }
}
