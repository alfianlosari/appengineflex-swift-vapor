import Vapor
import Fluent
import FluentMySQL

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    try services.register(FluentMySQLProvider())
    
    let mySQLUser = Environment.get("MYSQL_USER") ?? ""
    let mySQLPassword = Environment.get("MYSQL_PASSWORD") ?? ""
    let mySQLDatabase = Environment.get("MYSQL_DATABASE") ?? ""
    let mySQLIP = Environment.get("MYSQL_IP") ?? ""
    let databaseConfig = MySQLDatabaseConfig(hostname: mySQLIP, port: 3306, username: mySQLUser, password: mySQLPassword, database: mySQLDatabase)
    services.register(databaseConfig)
    
    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: Todo.self, database: .mysql)
    services.register(migrationConfig)
}
