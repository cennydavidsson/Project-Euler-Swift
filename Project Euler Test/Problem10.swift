//
//  Problem10.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem10: XCTestCase {

    // The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
    // Find the sum of all the primes below two million.
    func testProblem() {
        
        let oddNumbers = stride(from: 1, to: 2_000_000, by: 2)
        
        // added number 2 to reduce as its the only even prime number
        let sum = reduce(oddNumbers, 2) { $0 + (isPrimeNumber($1) ? $1 : 0 )}
        
        XCTAssertTrue(sum == 142913828922)
    }
}
