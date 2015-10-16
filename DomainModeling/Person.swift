//
//  Person.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

class Person {
    
    var firstName : String = "";
    var lastName : String = "";
    var age : Int = 0;
    
    private var job : Job?
    private weak var spouse : Person?
    
    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = age;
    }
    
    func toString() -> String {
        return "Name: \(firstName) \(lastName). Age: \(age)."
    }
    
    func setJob(newJob: Job) {
        if(self.age >= 16) {
            print("\(firstName) now works as a \(newJob.title)");
            self.job = newJob;
        } else {
            print("Too young to have a job");
        }
    }
    
    func getJob() -> Job? {
        return self.job;
    }
    
    func setSpouse(newSpouse: Person) {
        if(self.age >= 18) {
            print("\(firstName) married \(newSpouse.firstName)");
            self.spouse = newSpouse;
        } else {
            print("\(firstName) is too young to have a spouse");
        }
    }
    
    func getSpouse() -> Person? {
        return self.spouse;
    }

}
