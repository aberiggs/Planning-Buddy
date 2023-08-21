//
//  CreateAndEditEventView.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/10/23.
//

import SwiftUI
import SwiftData

struct CreateAndEditEventView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var eventName: String = String()
    @Bindable var event: PlanningEventItem = PlanningEventItem(name: "")
    
    func validEventName() -> (Bool) {
        return !eventName.isEmpty
    }
    
    var body: some View {
        VStack {  
            Spacer()
            
            Form {
                TextField("Name", text: $eventName)
            }.formStyle(GroupedFormStyle())
            
            HStack(alignment: .bottom) {
                Button {
                    if (validEventName()) {
                        event.name = eventName
                        modelContext.insert(event)
                        dismiss()
                    }
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        
                        Text("Save")
                            .foregroundColor(Color.white)
                            .bold()
                    }.frame(width: 80)
                }
                
            }.frame(height: 50)
            
        }
    }
}

#Preview {
    CreateAndEditEventView()
        .modelContainer(PreviewContainer)
    
}
