//
//  PreviewContainer.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/20/23.
//

import SwiftUI
import SwiftData

@MainActor
let PreviewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: PlanningEventItem.self, ModelConfiguration(inMemory: true)
        )
        
        var eventOne = PlanningEventItem(name: "Event one", date: Date.now)
        var eventTwo = PlanningEventItem(name: "Event two", date: Date.now)
        
        container.mainContext.insert(eventOne)
        container.mainContext.insert(eventTwo)
        
        return container
    } catch {
        fatalError("Failed to create PreviewContainer")
    }
}()
