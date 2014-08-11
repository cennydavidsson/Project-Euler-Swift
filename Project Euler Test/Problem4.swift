//
//  Problem4.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-11.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Problem4: XCTestCase {

    // A palindromic number reads the same both ways.
    // The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
    // Find the largest palindrome made from the product of two 3-digit numbers.
    func testProblem() {
        
        var maxPalindrome = 0, low = 100
        
        for var i = 999; i > low; i-- {
            for var ii = i; ii > low; ii--  {
                let result = i * ii
                if maxPalindrome < result && isPalindrome(result) {
                    maxPalindrome = result
                    low = min(ii, i)
                }
            }
        }
        
        XCTAssertTrue(maxPalindrome == 906_609)
    }
}
