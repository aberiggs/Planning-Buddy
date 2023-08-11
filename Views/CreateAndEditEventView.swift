//
//  CreateAndEditEventView.swift
//  Planning Buddy
//
//  Created by Sprocket Riggs on 8/10/23.
//

import SwiftUI

struct CreateAndEditEventView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var eventName: String = String()
    var body: some View {
        VStack {  
            Spacer()
            
            Form {
                TextField("Name", text: $eventName)
            }.formStyle(GroupedFormStyle())
            
            HStack(alignment: .bottom) {
                Button {
                    
                    
                    do {
                        let event = PlanningListEvent(context: moc)
                        //event.name = self.eventName
                            try moc.save()
                        } catch {
                            print("Error: \(error.localizedDescription)")
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

struct CreateAndEditEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAndEditEventView()
    }
}
