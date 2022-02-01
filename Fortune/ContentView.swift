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
    @State private var yourFortune:Item?
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    
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

                Button("Fortune"){
                    showingAlert1 = true
                    yourFortune = todos.randomElement()

                }
                
                .alert("Your fortune is \(yourFortune?.todo ?? "")", isPresented: $showingAlert1, presenting: yourFortune) { fortune in
                    Button("Done"){
                        
                        yourFortune = fortune
                        showingView = true
                    }
                    Button("Again!"){
                        showingAlert1 = true
                        yourFortune = todos.randomElement()
                    }
                }
                .padding()
                .background(Color.pink.cornerRadius(8))
                .foregroundColor(.white)
                
                Spacer()
                NavigationLink(destination: DetailView(detailText: yourFortune?.todo ?? ""), isActive: $showingView) {}
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
            .navigationBarTitle("Fortune App")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
