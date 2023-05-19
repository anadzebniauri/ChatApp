//
//  CoreDataManager.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 17.05.23.
//

import UIKit
import CoreData

class CoreDataManager {
    

    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelName")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data operations
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - CRUD operations
    
    func createEntity<T: NSManagedObject>(entityName: String) -> T? {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else {
            return nil
        }
        return T(entity: entityDescription, insertInto: viewContext)
    }

    func fetchEntities<T: NSManagedObject>(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            let entities = try viewContext.fetch(fetchRequest)
            return entities
        } catch {
            print("Failed to fetch entities: \(error)")
            return []
        }
    }
    
    func deleteEntity(entity: NSManagedObject) {
        viewContext.delete(entity)
        saveContext()
    }
}
