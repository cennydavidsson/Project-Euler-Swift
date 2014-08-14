//
//  Fibonacci.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-14.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Foundation


class Fibonacci : SequenceType {
    
    subscript(index: Int) -> Int{
        get {
            if index == 1 { return 0 }
            let n = Double(index)
            let fibIndexed = (1.0/sqrt(5.0)) * (pow(((1+sqrt(5.0))/2.0), n)-pow(((1-sqrt(5.0))/2.0), n))
            return Int(fibIndexed)
        }
    }
    subscript(range: Range<Int>) -> [Int] {
        get {
            var fibs: [Int] = []
            var g = generate(from: range.startIndex)
            for _ in range {
                fibs += [g.next()!]
            }
            return fibs
        }
    }
    
    func generate() -> GeneratorOf<Int> {
        return self .generate(from: 0)
    }
    
    func generate(#from:Int) -> GeneratorOf<Int> {
        var current = self[from], next = self[from+1]
        
        return GeneratorOf<Int> {
            var ret = current
            current = next
            next = next + ret
            return ret
        }
    }
    
    class func numbers(#below: Int) -> Array<Int> {
        
        var seq = [0, 1]
        while seq[(seq.count-1)] + seq[(seq.count-2)] <= below {
            seq += [seq[seq.count-1] + seq[seq.count-2]]
        }
        return seq
    }
    
    class func check(#number: Int) -> Bool {
        return true
    }
}