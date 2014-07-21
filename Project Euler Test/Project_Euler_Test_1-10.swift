//
//  Project_Euler_Test.swift
//  Project Euler Test
//
//  Created by Cenny Davidsson on 2014-07-03.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Project_Euler_Test: XCTestCase {
    
    func testProblemOne() {
        
        let sum = sumOf(0..<1_000, divsebelBy: 3, 5)
        
        XCTAssertTrue(sum == 233_168)
    }
    
    func testProblemTwo() {
        
        let filterdArrayOfFibo = fibonacciSequence(4_000_000).filter { $0 % 2 == 0 }
        let sumOfEvenFibo = filterdArrayOfFibo.reduce(0) {$0 + $1}
        
        XCTAssertTrue(sumOfEvenFibo == 4_613_732)
    }
    
    func testProblemThree() {
        
        let primes = primeFactorize(600_851_475_143)
        let sortedPrimes = primes.sorted{ $0 > $1 }
        
        XCTAssertTrue(sortedPrimes[0] == 6_857)
    }
    
    func testProblemFour() {
        
        var maxPalindrome = 0
        
        for i in 100...999 {
            for ii in 100...i  {
                let result = i * ii
                if maxPalindrome < result && isPalindrome(result) { maxPalindrome = result }
            }
        }
        
        XCTAssertTrue(maxPalindrome == 906_609)
    }
    
    func testProblemFive() {
        
        var primeFactors:[Int] = []
        let top = 20
        
        for i in 2...top { if isPrimeNumber(i){ primeFactors += i }}
        
        let primesWithPower = primeFactors.map() { pow(Float($0), floor(log(Float(top)) / log(Float($0)))) }
        let answer = Int(primesWithPower.reduce(1) { $0 * $1 })
        
        XCTAssertTrue(answer == 232_792_560)
    }
    
    func testProblemSix() {
        
        var numbers:[Int] = []
        
        for i in 1...100 { numbers += i }
        let sumOfSquares = numbers.reduce(0) { $0 + $1 * $1 }
        let squaresOfSums = numbers.reduce(0) { $0 + $1 }
        
        XCTAssertTrue(squaresOfSums * squaresOfSums - sumOfSquares == 25_164_150)
    }
    
    func testProblemSeven() {
        
        var highestPrimes = 0, primeCounter = 0, i = 0
        
        while primeCounter < 10_001 {
            if isPrimeNumber(i) { highestPrimes = i; primeCounter++ }
            i++
        }
        
        XCTAssertTrue(highestPrimes == 104_743)
    }
    
    func testProblemEight() {
        
        var numbers = [7,3,1,6,7,1,7,6,5,3,1,3,3,0,6,2,4,9,1,9,2,2,5,1,1,9,6,7,4,4,2,6,5,7,4,7,4,2,3,5,5,3,4,9,1,9,4,9,3,4,9,6,9,8,3,5,2,0,3,1,2,7,7,4,5,0,6,3,2,6,2,3,9,5,7,8,3,1,8,0,1,6,9,8,4,8,0,1,8,6,9,4,7,8,8,5,1,8,4,3,8,5,8,6,1,5,6,0,7,8,9,1,1,2,9,4,9,4,9,5,4,5,9,5,0,1,7,3,7,9,5,8,3,3,1,9,5,2,8,5,3,2,0,8,8,0,5,5,1,1,1,2,5,4,0,6,9,8,7,4,7,1,5,8,5,2,3,8,6,3,0,5,0,7,1,5,6,9,3,2,9,0,9,6,3,2,9,5,2,2,7,4,4,3,0,4,3,5,5,7,6,6,8,9,6,6,4,8,9,5,0,4,4,5,2,4,4,5,2,3,1,6,1,7,3,1,8,5,6,4,0,3,0,9,8,7,1,1,1,2,1,7,2,2,3,8,3,1,1,3,6,2,2,2,9,8,9,3,4,2,3,3,8,0,3,0,8,1,3,5,3,3,6,2,7,6,6,1,4,2,8,2,8,0,6,4,4,4,4,8,6,6,4,5,2,3,8,7,4,9,3,0,3,5,8,9,0,7,2,9,6,2,9,0,4,9,1,5,6,0,4,4,0,7,7,2,3,9,0,7,1,3,8,1,0,5,1,5,8,5,9,3,0,7,9,6,0,8,6,6,7,0,1,7,2,4,2,7,1,2,1,8,8,3,9,9,8,7,9,7,9,0,8,7,9,2,2,7,4,9,2,1,9,0,1,6,9,9,7,2,0,8,8,8,0,9,3,7,7,6,6,5,7,2,7,3,3,3,0,0,1,0,5,3,3,6,7,8,8,1,2,2,0,2,3,5,4,2,1,8,0,9,7,5,1,2,5,4,5,4,0,5,9,4,7,5,2,2,4,3,5,2,5,8,4,9,0,7,7,1,1,6,7,0,5,5,6,0,1,3,6,0,4,8,3,9,5,8,6,4,4,6,7,0,6,3,2,4,4,1,5,7,2,2,1,5,5,3,9,7,5,3,6,9,7,8,1,7,9,7,7,8,4,6,1,7,4,0,6,4,9,5,5,1,4,9,2,9,0,8,6,2,5,6,9,3,2,1,9,7,8,4,6,8,6,2,2,4,8,2,8,3,9,7,2,2,4,1,3,7,5,6,5,7,0,5,6,0,5,7,4,9,0,2,6,1,4,0,7,9,7,2,9,6,8,6,5,2,4,1,4,5,3,5,1,0,0,4,7,4,8,2,1,6,6,3,7,0,4,8,4,4,0,3,1,9,9,8,9,0,0,0,8,8,9,5,2,4,3,4,5,0,6,5,8,5,4,1,2,2,7,5,8,8,6,6,6,8,8,1,1,6,4,2,7,1,7,1,4,7,9,9,2,4,4,4,2,9,2,8,2,3,0,8,6,3,4,6,5,6,7,4,8,1,3,9,1,9,1,2,3,1,6,2,8,2,4,5,8,6,1,7,8,6,6,4,5,8,3,5,9,1,2,4,5,6,6,5,2,9,4,7,6,5,4,5,6,8,2,8,4,8,9,1,2,8,8,3,1,4,2,6,0,7,6,9,0,0,4,2,2,4,2,1,9,0,2,2,6,7,1,0,5,5,6,2,6,3,2,1,1,1,1,1,0,9,3,7,0,5,4,4,2,1,7,5,0,6,9,4,1,6,5,8,9,6,0,4,0,8,0,7,1,9,8,4,0,3,8,5,0,9,6,2,4,5,5,4,4,4,3,6,2,9,8,1,2,3,0,9,8,7,8,7,9,9,2,7,2,4,4,2,8,4,9,0,9,1,8,8,8,4,5,8,0,1,5,6,1,6,6,0,9,7,9,1,9,1,3,3,8,7,5,4,9,9,2,0,0,5,2,4,0,6,3,6,8,9,9,1,2,5,6,0,7,1,7,6,0,6,0,5,8,8,6,1,1,6,4,6,7,1,0,9,4,0,5,0,7,7,5,4,1,0,0,2,2,5,6,9,8,3,1,5,5,2,0,0,0,5,5,9,3,5,7,2,9,7,2,5,7,1,6,3,6,2,6,9,5,6,1,8,8,2,6,7,0,4,2,8,2,5,2,4,8,3,6,0,0,8,2,3,2,5,7,5,3,0,4,2,0,7,5,2,9,6,3,4,5,0]
        
        var start = 0, end = 13, biggestProduct = 0
        
        while end <= numbers.count {
            let product = numbers[start..<end].reduce(1) { $0 * $1 }
            biggestProduct = max(biggestProduct, product)
            start++; end++
        }
        
        XCTAssertTrue(biggestProduct == 23_514_624_000)
    }
    
    func testProblemNine() {
        
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

