//
//  ContentView+UI.swift
//  Fortune
//
//  Created by Kasidet Meteeputthi on 3/2/22.
//

import Foundation
import SwiftUI

extension ContentView {
    var fortuneInput: some View {
        HStack{
            TextEditor(text: $currentTodo)
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.pink, lineWidth: 2))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
            Button(action:{
                guard !self.currentTodo.isEmpty else{return}
                self.todos.append(Item(todo: self.currentTodo))
                self.currentTodo = ""
                self.disabled = false
            }){
                Image(systemName: "text.badge.plus")
            }
            .padding(.leading, 5)
        }
        .padding()
    }
}
