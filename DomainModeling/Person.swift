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
    
    var job : Job? {
        set(newJob) {
            if(age >= 16) {
                self.job = newJob;
            }
        }
        
        get {
            return self.job;
        }
    }
    
    weak var spouse : Person? {
        set(newSpouse) {
            if(age >= 18) {
                self.spouse = newSpouse;
            }
        }
        
        get {
            return self.spouse;
        }
    }
    
    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = age;
    }
    
    func toString() -> String {
        return "Name: \(firstName) + \(lastName). Age: \(age)."
    }

}
