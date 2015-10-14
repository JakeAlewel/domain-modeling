//
//  Money.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

enum CurrencyType {
    case USD
    case GBP
    case EUR
    case CAN
}

struct Money {
    
    var amount : Double;
    var currency : CurrencyType
    
    mutating func convertToCurrency(toCurrency: CurrencyType) {
        // TODO convert amount
        currency = toCurrency;
    }
    
    mutating func add(var moneyToAdd: Money) {
        moneyToAdd.convertToCurrency(currency);
        amount += moneyToAdd.amount;
    }
    
    mutating func subtract(var moneyToAdd: Money) {
        moneyToAdd.convertToCurrency(currency);
        amount -= moneyToAdd.amount;
    }
    
}
