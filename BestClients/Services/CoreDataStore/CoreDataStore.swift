//
//  CoreDataStore.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation
import CoreData

protocol CoreDataStoreProtocol {
    var context: NSManagedObjectContext { get }
    
    func saveContext()
    func fetchRequest() -> [UserInfo]
    func deleteUsers(id: UUID)
    func updateUser(localUser: UserInfo)
}

// MARK: - Core Data stack

class CoreDataStore: CoreDataStoreProtocol {
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "BestClients")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Success------")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchRequest() -> [UserInfo] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.map { UserInfo(user: $0) }
        } catch let error {
            print(error)
        }
        
        return []
    }
    
    func deleteUsers(id: UUID) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            saveContext()
            print("Delete")
        } catch {
            print(error)
        }
    }
    
    func updateUser(localUser: UserInfo) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", localUser.userID as CVarArg)
        
        do {
            if let user = try context.fetch(fetchRequest).first {
                user.name = localUser.name
                user.surname = localUser.surname
                
                saveContext()
            }
            
            print("Updated")
        } catch {
            print(error)
        }
    }
}

