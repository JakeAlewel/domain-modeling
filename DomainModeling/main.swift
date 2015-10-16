//
//  main.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

func testValidFamilyCases() {
    print(">> Create Parents");
    let mother = Person(firstName: "Susan", lastName: "FooBar", age: 24);
    print(mother.toString());
    let father = Person(firstName: "BillyBob", lastName: "FooBar", age: 25);
    print(father.toString());
    
    print(">> Marry Parents");
    mother.setSpouse(father);
    father.setSpouse(mother);
    
    print(">> Create Jobs");
    let astronaut = Job(title: "Astronaut", salary: 200000, salaryType: SalaryType.PerYear);
    let janitor = Job(title: "Janitor", salary: 18, salaryType: SalaryType.PerHour);
    mother.setJob(astronaut);
    father.setJob(janitor);
    
    print(">> Create Family");
    let family = Family(members: mother, father);
    print("Family Income: \(family.houseHoldIncome())");
    
    print(">> Add Child To Family");
    family.haveChild("Megan", childLastName: "FooBar");
    print("There are now \(family.members.count) family members");
}

func testMarryingTooYoung() {
    print(">> Create Teenagers");
    let teen1 = Person(firstName: "Keith", lastName: "Martinez", age: 15);
    let teen2 = Person(firstName: "Katie", lastName: "Gato", age: 16);
    print(teen1.toString());
    print(teen2.toString());
    
    print(">> Attempt To Marry Teenagers");
    teen1.setSpouse(teen2);
    teen2.setSpouse(teen1);
}

func testHavingAChildTooYoung() {
    print(">> Create Parents");
    let mother = Person(firstName: "Cristie", lastName: "Jobs", age: 19);
    print(mother.toString());
    let father = Person(firstName: "Harry", lastName: "Jobs", age: 20);
    print(father.toString());
    
    print(">> Create Family");
    let family = Family(members: mother, father);
    print("Family Income: \(family.houseHoldIncome())");
    
    print(">> Attempt To Have Child");
    family.haveChild("Not", childLastName: "Possible");
}

func testMoneyConversion() {
    func testConvertToCurrency(fromCurrency: CurrencyType, toCurrency: CurrencyType) {
        var oneUSD = Money(amount: 1.0, currency: fromCurrency);
        oneUSD.convertToCurrency(toCurrency);
        print("Converted 1.0 \(fromCurrency) to \(oneUSD.amount) \(toCurrency)");
    }
    
    testConvertToCurrency(CurrencyType.USD, toCurrency: CurrencyType.USD);
    testConvertToCurrency(CurrencyType.USD, toCurrency: CurrencyType.GBP);
    testConvertToCurrency(CurrencyType.USD, toCurrency: CurrencyType.EUR);
    testConvertToCurrency(CurrencyType.USD, toCurrency: CurrencyType.CAN);
    
    testConvertToCurrency(CurrencyType.GBP, toCurrency: CurrencyType.USD);
    testConvertToCurrency(CurrencyType.GBP, toCurrency: CurrencyType.GBP);
    testConvertToCurrency(CurrencyType.GBP, toCurrency: CurrencyType.EUR);
    testConvertToCurrency(CurrencyType.GBP, toCurrency: CurrencyType.CAN);
    
    testConvertToCurrency(CurrencyType.EUR, toCurrency: CurrencyType.USD);
    testConvertToCurrency(CurrencyType.EUR, toCurrency: CurrencyType.GBP);
    testConvertToCurrency(CurrencyType.EUR, toCurrency: CurrencyType.EUR);
    testConvertToCurrency(CurrencyType.EUR, toCurrency: CurrencyType.CAN);
    
    testConvertToCurrency(CurrencyType.CAN, toCurrency: CurrencyType.USD);
    testConvertToCurrency(CurrencyType.CAN, toCurrency: CurrencyType.GBP);
    testConvertToCurrency(CurrencyType.CAN, toCurrency: CurrencyType.EUR);
    testConvertToCurrency(CurrencyType.CAN, toCurrency: CurrencyType.CAN);
}

func testMoneyAddition() {

}

func testMoneySubtraction() {
    
}

func printDivider(sectionHeader: String) {
    var printString = ""
    for _ in 0...40 {
        printString += ">";
    }
    print("");
    print(printString);
    print(">>>>> \(sectionHeader)");
    print(printString);
    print("");
}

func performTests() {
    printDivider("Test Valid Family");
    testValidFamilyCases();
    
    printDivider("Test Marrying Too Young");
    testMarryingTooYoung();
    
    printDivider("Test Having A Child Too Young");
    testHavingAChildTooYoung();
    
    printDivider("Test Money Conversion");
    testMoneyConversion();
    
    printDivider("Test Money Addition");
    testMoneyAddition();
    
    printDivider("Test Money Subtraction");
    testMoneySubtraction();
}

performTests();

