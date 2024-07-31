//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    // tells computer + SwiftData that we will be temporarily storing data, updating, deleting them, etc.
    @Binding var showNewTask: Bool
    var body: some View {
        VStack{
            Text("Task title:")
                .font(.system(size:30))
                .fontWeight(.semibold)
            
            TextField("Enter the task description.", text:
                $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            .tint(.blue)
            Button{
                addToDo()
                self.showNewTask = false
            } label:{
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    func addToDo(){
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}







