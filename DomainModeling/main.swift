//
//  main.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

/*

Valid Tests

*/

let astronaut = Job(title: "Astronaut", salary: 200000, salaryType: SalaryType.PerYear);
let janitor = Job(title: "Janitor", salary: 18, salaryType: SalaryType.PerHour);

let mother = Person(firstName: "Susan", lastName: "FooBar", age: 24);
mother.setJob(astronaut);
print(mother.toString());

let father = Person(firstName: "BillyBob", lastName: "FooBar", age: 25);
father.setJob(janitor);
print(father.toString());

mother.setSpouse(father);
father.setSpouse(mother);

let family = Family(members: mother, father);
print("Family Income: \(family.houseHoldIncome())");
