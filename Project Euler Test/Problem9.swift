//
//  Problem9.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem9: XCTestCase {
    
    // A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
    // For example, 32 + 42 = 9 + 16 = 25 = 52.
    // There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    // Find the product abc.
    func testProblem() {
        
        var m = 2, n = 1, abcSum = 0
        var abc:(a:Int, b:Int, c:Int) = (0,0,0)
        let abcSumGoal = 1000
        
        while abcSum != abcSumGoal {
            if n > Int(sqrt(Float(abcSumGoal))) { break }
            
            abc = EuclidFormula(m, n)
            abcSum = abc.a + abc.b + abc.c
            
            if abcSum < abcSumGoal { m++ } else { n++; m = n+1 }
        }
        
        let result = abc.a * abc.b * abc.c
        
        XCTAssertTrue(result == 31875000)
    }
}
