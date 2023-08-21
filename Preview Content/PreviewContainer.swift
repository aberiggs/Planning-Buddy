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
        
        var eventOne = PlanningEventItem(name: "Event one")
        var eventTwo = PlanningEventItem(name: "Event two")
        
        container.mainContext.insert(eventOne)
        container.mainContext.insert(eventTwo)
        
        return container
    } catch {
        fatalError("Failed to create PreviewContainer")
    }
}()
