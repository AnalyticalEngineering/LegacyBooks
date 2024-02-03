//
//  PreviewContainer.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 1/31/24.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create preview container")
        }
    }
    
    func addExamples(_ examples: [any PersistentModel]) {
        Task { @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
}
