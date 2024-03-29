//
//  ContentView.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 1/30/24.
//

import SwiftUI
import SwiftData



enum SortOrder: LocalizedStringResource, Identifiable, CaseIterable {
    case status, title, author
    
    var id: Self {
        self
    }
}

struct BookListView: View {
    @State private var selectedStatus: Status = .onShelf
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.title) private var books: [Book]
    @State private var createNewBook = false
    @State private var sortOrder = SortOrder.status
    @State private var filter = ""
    
    var body: some View {
        NavigationStack {
            ///Sort Books Picker
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            BookList(sortOrder: sortOrder, filterString: filter)
                .searchable(text: $filter, prompt: Text("Search with Title or Author "))
                .navigationTitle("My Books")
                .toolbar {
                    Button {
                        createNewBook = true
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
                .sheet(isPresented: $createNewBook) {
                    AddNewBookView()
                        .presentationDetents([.medium])
                }
        }
    }
    
}

#Preview("English") {
    let preview = Preview(Book.self)
    let books = Book.sampleBooks
    let genres = Genre.sampleGenres
    preview.addExamples(books)
    preview.addExamples(genres)
    return BookListView()
        .modelContainer(preview.container)
}
#Preview("Spanish") {
    let preview = Preview(Book.self)
    let books = Book.sampleBooks
    let genres = Genre.sampleGenres
    preview.addExamples(books)
    preview.addExamples(genres)
    return BookListView()
        .modelContainer(preview.container)
        .environment(\.locale, Locale(identifier: "es-419"))
}
