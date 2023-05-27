//
//  CoreDataManager.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 17.05.23.
//

import CoreData

class CoreDataManager<Entity: NSManagedObject> {
    
    var viewContext: NSManagedObjectContext {
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
