//
//  DetailInfoModel+CoreDataProperties.swift
//  BestClients
//
//  Created by Дима Губеня on 16.09.2022.
//
//

import Foundation
import CoreData


extension DetailInfoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DetailInfoModel> {
        return NSFetchRequest<DetailInfoModel>(entityName: "DetailInfoModel")
    }

    @NSManaged public var nameInfo: String
    @NSManaged public var ageInfo: String
    @NSManaged public var genderInfo: String

}

extension DetailInfoModel : Identifiable {

}
