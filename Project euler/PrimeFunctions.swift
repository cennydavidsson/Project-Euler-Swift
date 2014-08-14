//
//  PrimeFunctions.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-13.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Foundation

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
    
    if isPrimeNumber(number) || number == 1 {return [number]}
    
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


func primeFactorizeWithExponent(number:Int) -> [(base: Int, exp: Int)] {
    
    var ints = primeFactorize(number)
    var powers:[(base: Int, exp: Int)] = []
    
    for p in ints {
        powers += [(base: p, exp: ints.reduce(0) { $0 + (p == $1 ? 1 : 0) })]
        ints = ints.filter  { p != $0 }
        if ints.isEmpty { break }
    }
    return powers
}