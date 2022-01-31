//
//  ContentView.swift
//  Fortune
//
//  Created by Kasidet Meteeputthi on 27/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTodo = ""
    @State private var todos: [Item] = []
    @State private var showingAlert = false
    @State private var yourFortune = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("New fortune..", text: $currentTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action:{
                        guard !self.currentTodo.isEmpty else{return}
                        self.todos.append(Item(todo: self.currentTodo))
                        self.currentTodo = ""
                    }){
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                }
                .padding()
                Button("Fortune") {
                    showingAlert = true
                    yourFortune = todos.randomElement()?.todo ?? ""
                }.alert(isPresented: $showingAlert){
                    Alert(
                        title: Text("Your fortune is"),
                        message: Text(yourFortune),
                        primaryButton: .destructive(Text("Delete")) {
                                            print("Deleting...")
                        },
                        secondaryButton: .cancel()
                    )
                   
                }
                List{
                    ForEach(todos){
                        todoEntry in
                        NavigationLink(destination: Text(todoEntry.todo)) {
                                            Text(todoEntry.todo)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
