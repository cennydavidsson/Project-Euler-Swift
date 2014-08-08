//
//  Project_Euler_Test.swift
//  Project Euler Test
//
//  Created by Cenny Davidsson on 2014-07-03.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import XCTest

class Project_Euler_Test: XCTestCase {
    
    // Problem 1
    //
    // If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
    // The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
    func testProblemOne() {
        
        let numbers = filter(0..<1_000) { $0 % 3 == 0 || $0 % 5 == 0 }
        let sum = numbers.reduce(0) { $0 + $1}
        
        XCTAssertTrue(sum == 233_168)
    }
    
    // Problem 2
    //
    // Each new term in the Fibonacci sequence is generated by adding the previous two terms.
    // By starting with 1 and 2, the first 10 terms will be: 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
    // By considering the terms in the Fibonacci sequence whose values do not exceed four million,
    // find the sum of the even-valued terms.
    func testProblemTwo() {
        
        let filterdArrayOfFibo = fibonacciSequence(4_000_000).filter { $0 % 2 == 0 }
        let sumOfEvenFibo = filterdArrayOfFibo.reduce(0) {$0 + $1}
        
        XCTAssertTrue(sumOfEvenFibo == 4_613_732)
    }
    
    // Problem 3
    //
    // The prime factors of 13195 are 5, 7, 13 and 29.
    // What is the largest prime factor of the number 600851475143?
    func testProblemThree() {
        
        let primes = primeFactorize(600_851_475_143)
        let sortedPrimes = primes.sorted{ $0 > $1 }
        
        XCTAssertTrue(sortedPrimes[0] == 6_857)
    }
    
    // Problem 4
    //
    // A palindromic number reads the same both ways.
    // The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
    // Find the largest palindrome made from the product of two 3-digit numbers.
    func testProblemFour() {
        
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
    
    // Problem 5
    //
    // 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    // What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    func testProblemFive() {
        
        let top = 20
        let primeFactors = filter(2...top) { isPrimeNumber($0) }
        
        let primesWithPower = primeFactors.map() { pow(Float($0), floor(log(Float(top)) / log(Float($0)))) }
        let answer = Int(primesWithPower.reduce(1) { $0 * $1 })
        
        XCTAssertTrue(answer == 232_792_560)
    }
    
    // Problem 6
    //
    // The sum of the squares of the first ten natural numbers is, 12 + 22 + ... + 102 = 385
    // The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)2 = 552 = 3025
    // Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
    // Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    func testProblemSix() {
        
        let range = 1...100
        
        let sumOfSquares = reduce(range, 0) { $0 + $1 * $1 }
        let squaresOfSums = reduce(range, 0) { $0 + $1 }
        
        XCTAssertTrue(squaresOfSums * squaresOfSums - sumOfSquares == 25_164_150)
    }
    
    // Problem 7
    //
    //By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
    // What is the 10 001st prime number?
    func testProblemSeven() {
        
        var highestPrimes = 0, primeCounter = 0, i = 0
        while primeCounter < 10_001 {
            if isPrimeNumber(i) { highestPrimes = i; primeCounter++ }
            i++
        }
        XCTAssertTrue(highestPrimes == 104_743)
    }
    
    // Problem 8
    //
    // The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
    // 73167176531330624919225119674...
    // Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
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
    
    // Problem 9
    //
    // A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
    // For example, 32 + 42 = 9 + 16 = 25 = 52.
    // There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    // Find the product abc.
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
    
    // Problem 10
    //
    // The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
    // Find the sum of all the primes below two million.
    func testProblemTen() {
        
        let oddNumbers = stride(from: 1, to: 2_000_000, by: 2)
        
        // added number 2 to reduce as its the only even prime number
        let sum = reduce(oddNumbers, 2) { $0 + (isPrimeNumber($1) ? $1 : 0 )}
        
        XCTAssertTrue(sum == 142913828922)
    }
}

