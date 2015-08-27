//
//  Matrix.swift
//  Project euler
//
//  Created by Cenny Davidsson on 2014-08-14.
//  Copyright (c) 2014 Cenny. All rights reserved.
//

import Foundation

func transpose2D<T>(array array:[[T]]) -> [[T]] {
    
    let rows = [T](count: array.count, repeatedValue: array[0][0])
    var transposedArray = [[T]](count: array[0].count, repeatedValue: rows)
    
    for var i = 0; i < array.count; ++i {
        for var j = 0; j < array[0].count; ++j {
            transposedArray[j][i] = array[i][j]
        }
    }
    return transposedArray
}

func diagonalsFrom2D<T: Equatable>(array array:[[T]], var withLength length: Int) -> [[T]] {
    
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

func mirror2D<T: Comparable>(array array:[[T]]) -> [[T]] {
    return Array(array.reverse())
}