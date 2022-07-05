//
//  Momo_MeterApp.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

@main
struct Momo_MeterApp: App {
    @StateObject private var controller = DataController()
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
