//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by Pavol Ocelka on 25/01/2025.
//

import XCTest
@testable import ToDoApp

final class ToDoAppTests: XCTestCase {

    func testAddingTodo() {
        var todos: [Todo] = []

        let newTodo = Todo(text: "Learn Swift", type: "Education")
        todos.append(newTodo)

        XCTAssertEqual(todos.count, 1, "There should be exactly one todo.")
        XCTAssertEqual(todos[0].text, "Learn Swift", "Todo text does not match.")
        XCTAssertEqual(todos[0].type, "Education", "Todo type does not match.")
    }

    func testDeletingTodo() {
        var todos: [Todo] = [
            Todo(text: "Go shopping", type: "Personal"),
            Todo(text: "Work on project", type: "Work")
        ]

        todos.remove(at: 0)

        XCTAssertEqual(todos.count, 1, "There should be exactly one todo after deletion.")
        XCTAssertEqual(todos[0].text, "Work on project", "Remaining todo text does not match.")
        XCTAssertEqual(todos[0].type, "Work", "Remaining todo type does not match.")
    }
}
