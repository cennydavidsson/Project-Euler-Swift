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