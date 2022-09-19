//
//  User+CoreDataProperties.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var id: UUID

}

extension User : Identifiable {

}
