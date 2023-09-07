//
//  EmployeeViewModel.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import UIKit

class EmployeeViewModel: NSObject {

    private var networkHandler : NetworkHandler!
    private(set) var empData: Employees!{
        
        didSet{
            
            self.bindEmployeeViewModelToController()
        }
    }
    var bindEmployeeViewModelToController : (() -> ()) = {}
    override init() {
            super.init()
            self.networkHandler =  NetworkHandler()
            callFuncToGetEmpData()
        }
        
        func callFuncToGetEmpData() {
            self.networkHandler.fetchEmployees { result in
                switch result {
                case .success(let employees):
                    //print("Employees: \(employees)")
                    self.empData = employees
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
}
