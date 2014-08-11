//
//  Problem3.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem3: XCTestCase {

    // The prime factors of 13195 are 5, 7, 13 and 29.
    // What is the largest prime factor of the number 600851475143?
    func testProblem() {
        
        let primes = primeFactorize(600_851_475_143)
        let sortedPrimes = sorted(primes, >)
        
        XCTAssertTrue(sortedPrimes[0] == 6_857)
    }
}
