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
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for:  Book.self)
    }
        init() {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
    }

