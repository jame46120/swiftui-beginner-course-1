//
//  Item.swift
//  ListApp
//
//  Created by Kasidet Meteeputthi on 20/1/22.
//

import Foundation

struct Item: Identifiable, Codable{
    var id = UUID()
    var todo: String
}
