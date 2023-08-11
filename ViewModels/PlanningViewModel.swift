//
//  PlanningViewModel.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/9/23.
//

import Foundation


class PlanningViewModel: ObservableObject {
    @Published var events: [PlanningEventItem] = []
    
    init() {}

    func createPlanningEventItem(newName: String) -> (Void) {

        let newEvent = PlanningEventItem(
            name: newName
        )
        events.append(newEvent)
    }
    
    func removePlanningEventItem(event: PlanningEventItem) -> (Void) {
        events.removeAll{$0.id == event.id}
    }
}
