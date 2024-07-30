//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        VStack{
            Text("Task title:")
                .font(.system(size:30))
                .fontWeight(.semibold)
            
            TextField("Enter the task description.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                Text("Is it important?")
            }
            .tint(.blue)
            Button{
                
            } label:{
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    NewToDoView()
}
