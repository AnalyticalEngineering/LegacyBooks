//
//  Quote.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 2/1/24.
//

import Foundation
import SwiftData


@Model
class Quote{
    var creationDate:  Date = Date.now
    var text:  String
    var page:  String?
    
    init(text: String, page: String? = nil)  {
        
        self.text = text
        self.page = page
    }
    var book: Book?
}
