//
//  Planning_BuddyApp.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/8/23.
//

import SwiftUI

@main
@available(iOS 17.0, *) 
struct Planning_BuddyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PlanningEventItem.self)
      
    }
}
