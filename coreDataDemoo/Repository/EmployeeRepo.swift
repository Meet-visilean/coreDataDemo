//
//  EmployeeRepo.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import Foundation
import CoreData

protocol EmployeeRepo{
    func create(employee: CDEmployee)
    func update(employee: CDEmployee) -> Bool
    func getall() -> [CDEmployee]?
    func delete(id: UUID) -> Bool
}

struct EmployeeDataRepo : EmployeeRepo{
    
    func create(employee: CDEmployee) {
        let cdEmployee = Employee(context: PersistentStorage.shared.context)
        cdEmployee.email = employee.email
        cdEmployee.name = employee.name
        cdEmployee.id = employee.id
        PersistentStorage.shared.saveContext()
    }
    
    func update(employee: CDEmployee) -> Bool{
        let cdEmployee = getCDEmployee(byIdentifier: employee.id)
        guard cdEmployee != nil else {return false}
        
        cdEmployee?.email = employee.email
        cdEmployee?.name = employee.name
        
        
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    func getall() -> [CDEmployee]? {
        let result =  PersistentStorage.shared.fetchManagedObject(managedObject: Employee.self)
        var employees : [CDEmployee] = []
        result?.forEach({(cdEmployee) in
            employees.append(cdEmployee.convertToEmployee())
        })
        return employees
        
    }
    
    
    func delete(id: UUID) -> Bool{
        let cdEmployee = getCDEmployee(byIdentifier: id)
        guard cdEmployee != nil else {return false}
        
        PersistentStorage.shared.context.delete(cdEmployee!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getCDEmployee(byIdentifier id: UUID) -> Employee?
    {
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
}
