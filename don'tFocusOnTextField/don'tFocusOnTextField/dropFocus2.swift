//
//  dropFocus2.swift
//  don'tFocusOnTextField
//
//  Created by user on 12.07.2022.
//

import Foundation
import SwiftUI

struct ContentView3: View {
    var body: some View {
        Group {
            NoteEditor()
            NotePreview()
        }.border(Color.red)
    }
}

struct NoteEditor: View {
    @State private var note = "text"

    var body: some View {
        TextEditor(text: $note)
            .frame(width: 300, height: 300)
            .focusedValue(\.noteValue, note)
    }
}

struct NotePreview: View {
    @FocusedValue(\.noteValue) var note

    var body: some View {
        Text(note ?? "Note is not focused")
    }
}

struct FocusedNoteValue: FocusedValueKey {
    typealias Value = String
}

extension FocusedValues {
    var noteValue: FocusedNoteValue.Value? {
        get { self[FocusedNoteValue.self] }
        set { self[FocusedNoteValue.self] = newValue }
    }
}
