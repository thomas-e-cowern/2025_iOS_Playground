// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Swifter

let server = HttpServer()

server["/"] = { request in
    return HttpResponse.ok(.text("Hello, World!"))
}

server["/users"] = { request in
    let json = """
        [
            {
                "id": 1,
                "name": "Alice"
            },
            {
                "id": 2,
                "name": "Bob"
            }
        ]
        """
    return HttpResponse.ok(.text(json))
}

do {
    try server.start(8080)
    RunLoop.main.run()
} catch {
    print("💥💥💥 Failed to start server: \(error.localizedDescription) 💥💥💥")
}


