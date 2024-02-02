//
//  Genre.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 2/1/24.
//

import SwiftUI
import SwiftData


@Model
class Genre {
    var name: String = ""
    var color: String = "FF0000"
    var books: [Book]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}
