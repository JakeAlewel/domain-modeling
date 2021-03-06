//
//  Family.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

class Family : CustomStringConvertible {
    
    var members : Array<Person>;
    var description : String {
        get {
            var stringToReturn = "[";
            for var n = 0; n < members.count; n++ {
                stringToReturn += members[n].description;
                if n==members.count-1 {
                    stringToReturn += "]";
                } else {
                    stringToReturn += ", ";
                }
            }
            stringToReturn += " @ \(houseHoldIncome()) PerYear"
            return stringToReturn;
        }
    };
    
    private var isLegalFamily : Bool {
        get {
            for person in members {
                if(person.age > 21) {
                    return true;
                }
            }
            return false;
        }
    }
    
    init (members: Person...) {
        self.members = members;
    }
    
    func houseHoldIncome() -> Double {
        var totalIncome = 0.0;
        for person in members {
            if person.getJob() != nil {
                totalIncome += person.getJob()!.calculateIncome(2000);
            }
        }
        return totalIncome;
    }
    
    func haveChild(childFirstName: String, childLastName: String) -> Bool {
        if isLegalFamily {
            members.append(Person(firstName: childFirstName, lastName: childLastName, age: 0));
            return true;
        }
        
        print("Family cannot legally have child");
        return false;
    }
    
}
