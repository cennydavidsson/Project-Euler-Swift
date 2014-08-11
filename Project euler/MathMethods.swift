//
//  MathMethods.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-07-03.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Foundation

func fibonacciSequence(top: Int) -> Array<Int> {
 
    var sequence = [0, 1]
    while sequence[(sequence.count-1)] + sequence[(sequence.count-2)] <= top {
        sequence.append(sequence[sequence.count-1] + sequence[sequence.count-2])
    }
    return sequence
}

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

func isPrimeNumber(number:Int) -> Bool {
    
    if number == 2 || number == 3 { return true }
    if number % 2 == 0 || number % 3 == 0 || number == 1 { return false }
    
    if (number+1) % 6 == 0 || (number-1) % 6 == 0 || (number % 2) != 0 || (number % 3) != 0 {
        
        let nSquared = Int(sqrtf(Float(number)))
        
        for var i = 5; i <= nSquared; i++ {
            if number % i == 0 && (i % 2 != 0 || i % 3 != 0) { return false }
        }
        
    } else {
        return false
    }
    return true
}

func primeFactorize(number:Int) -> [Int] {
    
    if isPrimeNumber(number) {return [number]}
    
    var factors:[Int] = [number]
    
    for i in 0..<factors.count {
        while !isPrimeNumber(factors[i]) {
            
            let n = factors[i]
            var d = 2
            
            while n % d != 0 { d++ }
            
            factors[i] = n / d
            factors.append(d)
        }
    }
    return factors
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

// MARK: 2D array functions

func transpose2D<T>(#array:[[T]]) -> [[T]] {
    
    let rows = [T](count: array.count, repeatedValue: array[0][0])
    var transposedArray = [[T]](count: array[0].count, repeatedValue: rows)
    
    for var i = 0; i < array.count; ++i {
        for var j = 0; j < array[0].count; ++j {
            transposedArray[j][i] = array[i][j]
        }
    }
    return transposedArray
}

func diagonalsFrom2D<T: Equatable>(#array:[[T]], var withLength length: Int) -> [[T]] {
    
    var diagonalsValuesAbove: [T] = []
    var diagonalsValuesBelow: [T] = []
    var alldiagonals: [[T]] = []
    
    let loop = array.count - length
    var j = loop
    var i = 0
    
    for _ in 0...loop{
        
        while j < array[0].count {
            diagonalsValuesAbove.append(array[i][j])
            diagonalsValuesBelow.append(array[j][i])
            ++i; ++j
        }
        
        alldiagonals.append(diagonalsValuesAbove)
        if diagonalsValuesBelow != diagonalsValuesAbove {
            alldiagonals.append(diagonalsValuesBelow)
        }
        diagonalsValuesAbove = []
        diagonalsValuesBelow = []
        j = array.count - ++length
        i = 0
    }
    return alldiagonals
}

func mirror2D<T: Comparable>(#array:[[T]]) -> [[T]] {
    return reverse(array)
}
