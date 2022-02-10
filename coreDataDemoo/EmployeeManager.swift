//
//  EmployeeManager.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import Foundation
import CoreData

struct EmployeeManager{
    private let _employeeDataRepository = EmployeeDataRepo()
    
    
    func createEmployee(employee: CDEmployee) {
        _employeeDataRepository.create(employee: employee)
    }
    
    func fetchEmployee() -> [CDEmployee]? {
        return _employeeDataRepository.getall()
    }
    
    func updateEmployee(employee: CDEmployee) -> Bool {
        return _employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool {
        return _employeeDataRepository.delete(id: id)
    }
    
    
}
