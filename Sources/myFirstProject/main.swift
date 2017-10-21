import Kitura
import MongoKitten
import HeliumLogger

// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

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
