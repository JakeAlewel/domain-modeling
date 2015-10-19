//
//  CurrencyExtension.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/18/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

extension Double {

    var USD : Money {
        return Money(amount: self, currency: CurrencyType.USD);
    }
    
    var GBP : Money {
        var money = self.USD;
        money.convertToCurrency(CurrencyType.GBP);
        return money;
    }
    
    var EUR : Money {
        var money = self.USD;
        money.convertToCurrency(CurrencyType.EUR);
        return money;
    }
    
    var CAN : Money {
        var money = self.USD;
        money.convertToCurrency(CurrencyType.CAN);
        return money;
    }
}