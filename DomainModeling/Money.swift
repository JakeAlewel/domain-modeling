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
        if currency != toCurrency {
            setCurrentAmountToCurrency(toCurrency);
            currency = toCurrency;
        }
    }
    
    private mutating func setCurrentAmountToCurrency(toCurrency: CurrencyType) {
        let mediatorValueInUSD = currentAmountInUSD();
        
        switch toCurrency {
        case .USD:
            amount = mediatorValueInUSD;
        case .GBP:
            amount = 0.5 * mediatorValueInUSD;
        case .EUR:
            amount = 1.5 * mediatorValueInUSD;
        case .CAN:
            amount = 1.25 * mediatorValueInUSD;
        }
    }
    
    private func currentAmountInUSD() -> Double {
        switch currency {
        case .USD:
            return amount;
        case .GBP:
            return 2 * amount;
        case .EUR:
            return 2.0 / 3.0 * amount;
        case .CAN:
            return 0.8 * amount;
        }
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
