//
//  persistentStorage.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import Foundation
import CoreData
import UIKit
final class PersistentStorage{
    
    private init(){}
    static let shared = PersistentStorage()
    lazy var persistentContainer : NSPersistentContainer = {
        // MARK: - Core Data stack
        
        
        
        let container = NSPersistentContainer(name: "coreDataDemoo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                    PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            return result
        }
        catch let error{
            debugPrint(error)
            
            
        }
        return nil
    }
}

