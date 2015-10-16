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

func testJobTooYoung() {
    print(">> Create Job");
    let astronaut = Job(title: "Astronaut", salary: 200000, salaryType: SalaryType.PerYear);
    
    print(">> Create Person");
    let person = Person(firstName: "Jake", lastName: "Kid", age: 12);
    
    print(">> Attempt to start job");
    person.setJob(astronaut);
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
    func testAddingCurrency(firstCurrency: CurrencyType, secondCurrency: CurrencyType) {
        var firstValue = Money(amount: 1.0, currency: firstCurrency);
        let secondValue = Money(amount: 1.0, currency: secondCurrency);
        firstValue.add(secondValue);
        print("Added 1.0 \(firstCurrency) to 1.0 \(secondCurrency) to equal \(firstValue.amount) \(firstCurrency)");
    }
    
    testAddingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.USD);
    testAddingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.GBP);
    testAddingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.EUR);
    testAddingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.CAN);
    
    testAddingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.USD);
    testAddingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.GBP);
    testAddingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.EUR);
    testAddingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.CAN);
    
    testAddingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.USD);
    testAddingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.GBP);
    testAddingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.EUR);
    testAddingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.CAN);
    
    testAddingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.USD);
    testAddingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.GBP);
    testAddingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.EUR);
    testAddingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.CAN);
}

func testMoneySubtraction() {
    func testSubtractingCurrency(firstCurrency: CurrencyType, secondCurrency: CurrencyType) {
        var firstValue = Money(amount: 1.0, currency: firstCurrency);
        let secondValue = Money(amount: 1.0, currency: secondCurrency);
        firstValue.subtract(secondValue);
        print("Subtracted 1.0 \(secondCurrency) from 1.0 \(firstCurrency) to equal \(firstValue.amount) \(firstCurrency)");
    }
    
    testSubtractingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.USD);
    testSubtractingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.GBP);
    testSubtractingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.EUR);
    testSubtractingCurrency(CurrencyType.USD, secondCurrency: CurrencyType.CAN);
    
    testSubtractingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.USD);
    testSubtractingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.GBP);
    testSubtractingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.EUR);
    testSubtractingCurrency(CurrencyType.GBP, secondCurrency: CurrencyType.CAN);
    
    testSubtractingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.USD);
    testSubtractingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.GBP);
    testSubtractingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.EUR);
    testSubtractingCurrency(CurrencyType.EUR, secondCurrency: CurrencyType.CAN);
    
    testSubtractingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.USD);
    testSubtractingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.GBP);
    testSubtractingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.EUR);
    testSubtractingCurrency(CurrencyType.CAN, secondCurrency: CurrencyType.CAN);
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
    
    printDivider("Test Starting Job Too Young");
    testJobTooYoung();
    
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
    
    printDivider("Tests Complete");
}

performTests();

