//
//  LegacyBooksApp.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 1/30/24.
//

import SwiftUI
import SwiftData

@main
struct LegacyBooksApp: App {
    let container: ModelContainer
    
    
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(container)
    }
    init() {
     
        let schema = Schema([Book.self])
        let config = ModelConfiguration("LegacyBooksApp", schema: schema)
        do{
            container = try ModelContainer(for: schema, configurations: config)
        }catch{
            fatalError("Could not configure container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
               
        }
    }

