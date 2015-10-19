//
//  Mathematics.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/18/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

protocol Mathematics {
    
    func + (left: Self, right: Self) -> Self;
    func - (left: Self, right: Self) -> Self;
    
}