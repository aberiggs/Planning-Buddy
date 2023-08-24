//
//  PlanningEventItem.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/9/23.
//

import Foundation
import SwiftData

@Model class PlanningEventItem {
    
    @Attribute(.unique) var id: UUID
    @Attribute var name: String
    @Attribute var date: Date
    
    init(name: String, date: Date) {
        self.id = UUID()
        self.name = name
        self.date = date
    }
    
    
}

/*
@available(iOS 17.0, *)
extension PlanningEventItem: Hashable {
    static func == (lhs: PlanningEventItem, rhs: PlanningEventItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
*/


