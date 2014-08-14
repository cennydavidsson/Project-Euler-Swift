//
//  MathMethods.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-07-03.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Foundation

func isPalindrome(number: Int) -> Bool {
    
    let numberString = Array(number.description)
    return numberString.reverse() == numberString
}

func EuclidFormula(m:Int, n:Int) -> (a:Int, b:Int, c:Int) {
    
    if m <= n { return (0, 0, 0) }
    
    let a = m*m - n*n
    let b = 2*m*n
    let c = m*m + n*n
    
    return (a, b, c)
}

func maxSumOf(#array:[Int],withRangeLength length:Int) -> Int {
    
    struct FixedLengthRange {
        init(length:Int) { self.length = length }
        var firstValue = 0
        let length: Int
        var end: Int { return firstValue + length }
        var range: Range<Int> { return firstValue..<(firstValue+length) }
    }
    
    var range = FixedLengthRange(length: length)
    var sum = 0
    
    while array.count >= range.end {
        
        sum = max(array[range.range].reduce(1) { $0 * $1 }, sum)
        range.firstValue++
    }
    return sum
}
