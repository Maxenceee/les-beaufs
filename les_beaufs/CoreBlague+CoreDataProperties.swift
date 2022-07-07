//
//  CoreBlague+CoreDataProperties.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import Foundation
import CoreData

extension CoreBlague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreBlague> {
        return NSFetchRequest<CoreBlague>(entityName: "CoreBlague")
    }

    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?

}

extension CoreBlague : Identifiable {

}
