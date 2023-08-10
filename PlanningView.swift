//
//  PlanningView.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/8/23.
//

import SwiftUI


extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct PlanningView: View {
    @StateObject var viewModel = PlanningViewModel()
    @State private var newEventName = String()

    var body: some View {
        VStack {
            Text("Welcome to planning!")
            
            ForEach(viewModel.events) { event in
                HStack {
                    Text(event.name)
                    Button {
                        viewModel.removePlanningEventItem(event: event)
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
            
            Form {
                TextField(
                    "New Event Name",
                    text: $newEventName
                )
                .textInputAutocapitalization(.sentences)
                .disableAutocorrection(false)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button {
                    viewModel.createPlanningEventItem(newName: newEventName)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        
                        Text("Create Event")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
            

            
        
        
        }
    }
}

struct PlanningView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningView()
    }
}

