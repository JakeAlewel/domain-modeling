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
    
}

func testHavingAChildTooYoung() {
    
}

func testMoneyConversion() {
    
}

func testMoneyAddition() {
    
}

func testMoneySubtraction() {
    
}

print(">>>>>");
print(">>>>> Test Valid Family");
testValidFamilyCases();
print(">>>>>");
print(">>>>> Test Marrying Too Young");
testMarryingTooYoung();
print(">>>>>");
print(">>>>> Test Having A Child Too Young");
testHavingAChildTooYoung();
print(">>>>>");
print(">>>>> Test Money Conversion");
testMoneyConversion();
print(">>>>>");
print(">>>>> Test Money Addition");
testMoneyAddition();
print(">>>>>");
print(">>>>> Test Money Subtraction");
testMoneySubtraction();

