import Routing
import Vapor

public func routes(_ router: Router) throws {
    
    router.group("todo") { (router) in
        
        // Create Todo
        router.post(Todo.self) { req, todo -> Future<Todo> in
            return todo.save(on: req)
        }
        
        // Get single Todo
        router.get(Int.parameter) { req -> Future<Todo> in
            let id = try req.parameters.next(Int.self)
            return Todo.find(id, on: req).map { (todo) -> Todo in
                guard let todo = todo else {
                    throw Abort(.notFound)
                }
                return todo
            }
        }
        
        // Get All Todos
        router.get() { req -> Future<[Todo]> in
            return Todo.query(on: req).all()
        }
        
        // Update single todo
        router.put(Todo.self) { (req, updateTodo) -> Future<Todo> in
            
            guard let id = updateTodo.id else {
                throw Abort(.notFound)
            }
            
            return Todo.find(id, on: req).flatMap(to: Todo.self) { (todo) -> Future<Todo> in
                guard var todo = todo else {
                    throw Abort(.notFound)
                }
                todo = updateTodo
                return todo.save(on: req)
            }
        }
    }
}
