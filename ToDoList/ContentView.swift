//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @State private var showNewTask = false
    // links views, initially second view is not shown
   
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack{
            HStack{
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                Button{
                    withAnimation{
                        self.showNewTask = true
                    }
                } label:{
                    Text("+")
                }
                .font(.system(size: 40))
                .fontWeight(.bold)
                
            }
            .padding()
            Spacer()
            List {
                ForEach(toDos) {toDoItem in
                    if toDoItem.isImportant == true {
                        Text("❗️" + toDoItem.title)
                    } else{
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
        // NewToDoView shows up at the bottom because we put it at the bottom of the code (after the VStack)
    }
    func deleteToDo(at offsets: IndexSet){
        for offset in offsets{
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
