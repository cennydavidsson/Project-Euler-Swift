//
//  Math_Methods_Tests.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-07-10.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Cocoa
import XCTest

class Math_Methods_Tests: XCTestCase {
    
    func testSumOf() {
       let sum = sumOf(1...15, divsebelBy: 5)
        XCTAssertTrue(sum == 30)
    }
    
    func testFibonacciSeqTest() {
        
        let arrayOfFibo = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169]
        
        let anotherArrayOfFibo = fibonacciSequence(39090000)
        
        XCTAssertTrue(anotherArrayOfFibo == arrayOfFibo, "Fibonacci sequance is wrong")
    }
    
    func testForPrimes() {
        
        let arrayOfPrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997,1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, 1087,1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223]
        
        var arrayOfResult:[Bool] = []
        
        for i in arrayOfPrimes {
            XCTAssert(isPrimeNumber(i), "\(i) is a prime but failed the test")
        }
    }
    
    func testForNotPrimes() {
        
        let arrayOfPrimes = [1, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22,24, 25, 26, 27, 28, 30, 33, 34, 44, 60, 162, 710, 711, 712, 713, 714, 715, 716, 718, 720, 721, 722, 723, 724, 725, 726, 728, 729, 800, 1050, 1222]
        
        var arrayOfResult:[Bool] = []
        for i in arrayOfPrimes {
            XCTAssert(!isPrimeNumber(i), "\(i) is not a prime but failed the test")
        }
    }
    
    func testForPalindrome() {
        let arrayOfPalindromes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 22, 33, 44, 55, 66, 77, 88, 99, 101, 111, 121, 131, 141, 151, 161, 171, 181, 191, 202, 212, 222, 232, 242, 252, 262, 272, 282, 292, 303, 313, 323, 333, 343, 353, 363, 373, 383, 393, 404, 414, 424, 434, 444, 454, 464, 474, 484, 494, 505, 515, 525, 535, 545, 555, 565, 575, 585, 595, 606, 616, 626, 636, 646, 656, 666, 676, 686, 696, 707, 717, 727, 737, 747, 757, 767, 777, 787, 797, 808, 818, 828, 838, 848, 858, 868, 878, 888, 898, 909, 919, 929, 939, 949, 959, 969, 979, 989, 999, 1001, 1111, 1221, 1331, 1441, 1551, 1661, 1771, 1881, 1991, 2002, 2112, 2222, 2332, 2442, 2552, 2662, 2772, 2882, 2992, 3003, 3113, 3223]
        
        var arrayOfResult:[Bool] = []
        
        for i in arrayOfPalindromes {
            XCTAssert(isPalindrome(i), "\(i) is a palindrome but failed the test")
        }
    }
    
    func testForNotPalindrome() {
        let arrayOfPalindromes = [10, 12, 23, 35, 43, 25, 16, 67, 82, 29, 416, 322, 331, 144, 455, 623, 237, 854, 92, 641, 1121, 1121, 765, 25234, 4838, 2743, 9023, 9098, 123, 321, 1313 ]
        
        var arrayOfResult:[Bool] = []
        for i in arrayOfPalindromes {
            XCTAssert(!isPalindrome(i), "\(i) is not a palindrome but failed the test")
        }
    }
    
    func testEuclidFormula() {
        
        let resultOne = EuclidFormula(3, 2)
        let resultTwo = EuclidFormula(6, 3)
        
        XCTAssertTrue( resultOne.a == 5 && resultOne.b == 12 && resultOne.c == 13)
        XCTAssertTrue( resultTwo.a == 27 && resultTwo.b == 36 && resultTwo.c == 45)
    }
}
