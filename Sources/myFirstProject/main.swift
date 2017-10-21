import Kitura
import MongoKitten
import HeliumLogger
import Foundation


// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

let mongoDB: Database?
mongoDB = try Database("mongodb://benterrysmith:benterrysmith@ds227035.mlab.com:27035/heroku_cfng8982")
// Add your application here
print("Connected to MongoDB")

// Handle HTTP GET requests to /
router.get("/hello/:name") {
    request, response, next in
    let name = request.parameters["name"] ?? "World!"
    response.send("Hello \(name)")
    
}


// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
