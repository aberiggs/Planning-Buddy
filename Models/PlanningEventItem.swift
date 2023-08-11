//
//  PlanningEventItem.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/9/23.
//

import Foundation

struct PlanningEventItem: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    //let date: TimeInterval
}
