//
//  ContentView.swift
//  Fortune
//
//  Created by Kasidet Meteeputthi on 27/1/22.
//

import SwiftUI

struct ContentView: View {
    @State internal var currentTodo = ""
    @State internal var todos = [Item]()
    @State internal var showingView = false
    @State internal var yourFortune: Item?
    @State internal var showingAlert = false
    @State internal var disabled = true
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                fortuneInput

                Button("Fortune"){
                    showingAlert = true
                    yourFortune = todos.randomElement()
                }
                .disabled(disabled)
                .alert("Your Fortune is...", isPresented: $showingAlert, actions: {
                    Button("Done"){
                        showingView = true
                    }
                    Button("Again!"){
                        yourFortune = todos.randomElement()
                        showingAlert = true
                    }
                }, message: {
                    Text(yourFortune?.todo ?? "")
                })
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
