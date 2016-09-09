// Generated automatically by Perfect Assistant Application
// Date: 2016-09-02 15:12:11 +0000

// Package imports are disabled apart from the main PerfectLib
// To enable, uncomment the line

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

// set up mock data
JSONDecoding.registerJSONDecodable(name: Movie.registerName, creator: { return Movie() })
let movieData = MovieData()

// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()
routes.add(method: .get, uri: "/api/v1/list", handler: {
	request, response in

	print("Requesting /api/v1/list")

	response.setHeader(.contentType, value: "text/application-json")
	response.appendBody(string: MovieData.list())
	response.completed()
	}
)

routes.add(method: .get, uri: "/", handler: {
	request, response in
	
	let webRoot = request.documentRoot
	mustacheRequest(
		request: request, response: response,
		handler: ListHandler(),
		templatePath: webRoot + "/index.mustache"
	)
	}
)

// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

// Gather command line options and further configure the server.
// Run the server with --help to see the list of supported arguments.
// Command line arguments will supplant any of the values set above.
configureServer(server)


do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
