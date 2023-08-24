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
    @State private var eventDate: Date = Date()
    @Bindable var event: PlanningEventItem = PlanningEventItem(name: "", date: Date.now)
    
    
    func validEventName() -> (Bool) {
        // TODO: Make this more robust
        return !eventName.isEmpty
    }
    
    // TODO: Create date validation check
    
    var body: some View {
        VStack {  
            Spacer()
            
            Form {
                TextField("Name", text: $eventName)
                DatePicker("Date", selection: $eventDate).datePickerStyle(GraphicalDatePickerStyle())
            }.formStyle(GroupedFormStyle())
            
            HStack(alignment: .bottom) {
                Button {
                    if (validEventName()) {
                        event.name = eventName
                        event.date = eventDate
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
