//
//  MustacheHandler.swift
//  Perfect-UnifiedBackend
//
//  Created by Jonathan Guthrie on 2016-09-02.
//
//

import PerfectLib
import PerfectHTTP
import PerfectMustache


struct ListHandler: MustachePageHandler { // all template handlers must inherit from PageHandler
	// This is the function which all handlers must impliment.
	// It is called by the system to allow the handler to return the set of values which will be used when populating the template.
	// - parameter context: The MustacheWebEvaluationContext which provides access to the HTTPRequest containing all the information pertaining to the request
	// - parameter collector: The MustacheEvaluationOutputCollector which can be used to adjust the template output. For example a `defaultEncodingFunc` could be installed to change how outgoing values are encoded.
	func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
		var values = MustacheEvaluationContext.MapType()
//		values["value"] = "hello"
		/// etc.

		var ary = [[String:Any]]()

		for movie in MovieData.listAsArray() {
			ary.append([
				"id": movie.id,
				"title": movie.title,
				"year": movie.year,
				"art": movie.art
				])
		}
		values["movies"] = ary

		contxt.extendValues(with: values)
		do {
			try contxt.requestCompleted(withCollector: collector)
		} catch {
			let response = contxt.webResponse
			response.status = .internalServerError
			response.appendBody(string: "\(error)")
			response.completed()
		}
	}
}
