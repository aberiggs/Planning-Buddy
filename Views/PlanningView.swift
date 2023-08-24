//
//  PlanningView.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/8/23.
//

import SwiftUI
import SwiftData

struct PlanningView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel = PlanningViewModel()
    @State private var newEventName = String()
    @Query (sort: \PlanningEventItem.date) private var events: [PlanningEventItem]
    
    func deleteEvent(eventToDelete: PlanningEventItem) -> (Void) {
        modelContext.delete(eventToDelete)
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Planning List Name").font(.largeTitle).bold()
                Text("Date")
                    .font(.callout)
                
                    
                List {
                    ForEach(events) { event in
                        VStack {
                            HStack{
                                Text(event.name)
                                Spacer()
                            }
                            
                            HStack {
                                Text(event.date.formatted(.dateTime.hour().minute()))
                                Spacer()
                                
                            }
                        }.swipeActions(edge: .trailing) {
                            Button (action: { deleteEvent(eventToDelete: event) }) {
                                Label("Delete", systemImage: "minus.circle.fill")
                            }.tint(.red)
                        }
                        
                    }
                    
                }.listStyle(.plain)
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    NavigationLink(destination: CreateAndEditEventView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Create New Event")
                                .foregroundColor(Color.white)
                                .bold()
                        }.frame(width: 200)
                    }
                }.frame(height: 50)
                
                
            }
            
        }
    }
}

#Preview {
    PlanningView().modelContainer(for: PlanningEventItem.self)
}

