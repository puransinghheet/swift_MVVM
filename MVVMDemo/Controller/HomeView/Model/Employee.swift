//
//  Employee.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import Foundation
// MARK: - Welcome
struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

// MARK: - Datum
struct EmployeeData: Decodable {
    
    let id, employeeAge, employeeSalary:Int
    let employeeName: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
