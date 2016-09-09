//
//  File.swift
//  CocoaConfDCDemo
//
//  Created by Jonathan Guthrie on 2016-09-02.
//
//

import PerfectLibiOS

public class Movie : JSONConvertibleObject {
	static let registerName = "movie"
	var id			: String
	var title		: String
	var year		: Int
	var art			: String

	override init() {
		self.id         = ""
		self.title		= ""
		self.year		= 0
		self.art		= ""
	}

	override public func setJSONValues(_ values: [String : Any]) {
		self.id			= getJSONValue(named: "id", from: values, defaultValue: "")
		self.title		= getJSONValue(named: "title", from: values, defaultValue: "")
		self.year		= getJSONValue(named: "year", from: values, defaultValue: 0)
		self.art		= getJSONValue(named: "art", from: values, defaultValue: "")
	}
	override public func getJSONValues() -> [String : Any] {
		return [
			JSONDecoding.objectIdentifierKey:Movie.registerName,
			"id":id,
			"title":title,
			"year":year,
			"art":art
		]
	}

}


extension Movie {
	public static func processMap(_ obj: [Any]) -> [Movie] {
		var list = [Movie]()
		for index in 0..<obj.count {
			let this = Movie()
			let thisObj = obj[index] as! [String:Any]
			if let id		= thisObj["id"]			{ this.id = id as! String }
			if let title	= thisObj["title"]		{ this.title = title as! String }
			if let art		= thisObj["art"]		{ this.art = art as! String }
			if let year		= thisObj["year"]		{ this.year = year as! Int }
			list.append(this)
		}
		return list
	}
}
