//
//  CoreDataManager.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 17.05.23.
//

import CoreData

class CoreDataManager<Entity: NSManagedObject> {
    
    // MARK: - Core Data stack
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "ChatApp")
//        container.loadPersistentStores { _, error in
//            if let error = error as NSError? {
//                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
    
    var viewContext: NSManagedObjectContext {
//        return persistentContainer.viewContext
        return AppDelegate.coreDataContainer.viewContext
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

    func fetch(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [Entity] {
        let fetchRequest = NSFetchRequest<Entity>(entityName: entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors

        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch entities: \(error)")
            return []
        }
    }
    
    func delete(entity: Entity) {
        viewContext.delete(entity)
        saveContext()
    }
}
