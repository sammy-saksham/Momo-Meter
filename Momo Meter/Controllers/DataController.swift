//
//  DataController.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading persistent stores: \(error.localizedDescription)")
            }
        }
    }
}
