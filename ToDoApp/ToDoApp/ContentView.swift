//
//  ContentView.swift
//  ToDoApp
//
//  Created by Pavol Ocelka on 25/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newTodoText: String = ""
    @State private var newTodoType: String = ""
    
    @State private var todos: [Todo] = []
    
    @State private var showAlert: Bool = false
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("ToDo's")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                
                List{
                    ForEach(todos, id: \.id) { todo in
                        VStack(alignment: .leading){
                            Text(todo.text)
                                .font(.headline)
                            Text(todo.type)
                                .font(.caption)
                        }
                    }
                    .onDelete(perform: deleteTodo)
                    
                }
                .scrollContentBackground(.hidden)
                
                TextField("Todo name..", text: $newTodoText)
                    .autocorrectionDisabled(true)
                    .padding()
                    .frame(height: 50)
                    .background(.yellow)
                    .clipShape(.rect(cornerRadius: 5))
                    .padding(.horizontal)
                TextField("Type..", text: $newTodoType)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(height: 50)
                    .background(.orange)
                    .clipShape(.rect(cornerRadius: 5))
                    .padding(.horizontal)
                
                
                Button("Add"){
                    if !newTodoText.isEmpty{
                        let newTodo = Todo(text: newTodoText, type: newTodoType)
                        
                        todos.append(newTodo)
                        
                        newTodoText = ""
                        newTodoType = ""
                    } else{
                        showAlert = true
                    }
                    
                    
                }
                .frame(width: 200, height: 50)
                .foregroundStyle(.primary)
                .background(.white)
                .clipShape(.capsule)
                
                .alert("Error", isPresented: $showAlert){
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Name cannot be blank")
                }
            }
        }
    }
    
    private func deleteTodo(at offsets: IndexSet){
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

