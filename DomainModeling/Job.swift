//
//  Job.swift
//  DomainModeling
//
//  Created by Jacob Alewel on 10/13/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

enum SalaryType {
    case PerHour
    case PerYear
}

class Job : CustomStringConvertible {
    
    var title : String = "";
    var salary : Double = 0;
    var salaryType : SalaryType;
    var description : String {
        get {
            return "\(title) @ \(salary) \(salaryType)";
        }
    };
    
    init(title: String, salary: Double, salaryType: SalaryType) {
        self.title = title;
        self.salary = salary;
        self.salaryType = salaryType;
    }
    
    func calculateIncome(hoursWorked: Double) -> Double {
        if(salaryType == SalaryType.PerHour) {
            return salary * hoursWorked;
        } else {
            return salary;
        }
    }
    
    func raise(raisePercentage: Double) {
        salary += salary * raisePercentage;
    }
    
}