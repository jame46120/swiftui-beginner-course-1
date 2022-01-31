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
    @State private var showingView = false
    @State private var yourFortune = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextEditor(text: $currentTodo)
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.pink, lineWidth: 2))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
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
                        primaryButton: .destructive(Text("Read More")) {
                            self.showingView = true
                        },
                        secondaryButton: .cancel()
                    )
                }.foregroundColor(Color.pink)
                NavigationLink(destination: DetailView(detailText: yourFortune), isActive: $showingView) {}
                List{
                    ForEach(todos){
                        todoEntry in
                        NavigationLink(destination: DetailView(detailText: todoEntry.todo)) {
                            Text(todoEntry.todo)
                                .lineLimit(2)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Fortune App")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
