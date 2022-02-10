//
//  Employee+CoreDataProperties.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    
    func convertToEmployee()-> CDEmployee
    {
        return CDEmployee(name: self.name, id: self.id!, email: self.email)
    }
}

