//
//  Todo.swift
//  App
//
//  Created by Alfian Losari on 10/22/18.
//

import Foundation
import FluentMySQL
import Vapor

struct Todo: Content, MySQLModel, Migration {
    
    var id: Int?
    var title: String
    var content: String
    var dueDate: Date
    
    public static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection, closure: { builder in
            builder.field(for: \.id,  isIdentifier: true)
            builder.field(for: \.title)
            builder.field(for: \.content, type: .text())
            builder.field(for: \.dueDate)
        })
    }
    
}
