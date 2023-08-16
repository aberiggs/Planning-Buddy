//
//  PlanningView.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/8/23.
//

import SwiftUI
import SwiftData

struct PlanningView: View {
    
    /*
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: PlanningListEvent.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \PlanningListEvent.name, ascending: true)])
    */
    
    // var plannedEvents: FetchedResults<PlanningListEvent>
    
    @StateObject var viewModel = PlanningViewModel()
    @State private var newEventName = String()
    @Query private var events: [PlanningEventItem]
    
    func validateEventName() -> (Bool) {
        return !newEventName.isEmpty
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Planning List Name").font(.largeTitle).bold()
                Text("Date")
                    .font(.callout)
                
                /*
                List {
                    ForEach(plannedEvents, id: \.self) { event in
                        HStack {
                            Text(event.name ?? "Failure")
                            Button {
                                //viewModel.removePlanningEventItem(event: event)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.pink)
                                        .frame(width: 30, height: 30)
                                    Text("X")
                                        .foregroundColor(Color.white)
                                    
                                }
                            }
                        }
                        
                    }
                    
                }*/
                
                
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

struct PlanningView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningView()
            .modelContainer(for: PlanningEventItem.self)
    }
}

