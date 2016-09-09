//
//  MovieOps.swift
//  CocoaConfDCDemoBackend
//
//  Created by Jonathan Guthrie on 2016-09-02.
//
//

import Foundation


public class MovieData {
	public static func list() -> String {
		let mocks = MockData()
		mocks.generate()
		return mocks.toString()
	}
	public static func listAsArray() -> [Movie] {
		let mocks = MockData()
		mocks.generate()
		return mocks.movies
	}
}
