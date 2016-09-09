//
//  MockData.swift
//  CocoaConfDCDemo
//
//  Created by Jonathan Guthrie on 2016-09-02.
//
//

import Foundation
import PerfectLib

class MockData {
	public var movies = [Movie]()

	public func generate() {
		// returns JSON to simulate data from NoSQL


		let fifthElement = Movie()
		fifthElement.title = "The Fifth Element"
		fifthElement.year = 1997
		fifthElement.art = "http://ia.media-imdb.com/images/M/MV5BZWFjYmZmZGQtYzg4YS00ZGE5LTgwYzAtZmQwZjQ2NDliMGVmXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_UY268_CR2,0,182,268_AL_.jpg"


		let dieHard1 = Movie()
		dieHard1.title = "Die Hard"
		dieHard1.year = 1998
		dieHard1.art = "http://ia.media-imdb.com/images/M/MV5BYmY2ZGEwMTYtNjBmZS00OGE4LWEyMmUtNjAwMWUxZjVmZTRiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg"

		let gijoe = Movie()
		gijoe.title = "G.I. Joe: Retaliation "
		gijoe.year = 2013
		gijoe.art = "http://ia.media-imdb.com/images/M/MV5BNzk5ODM0OTQ0N15BMl5BanBnXkFtZTcwODg2ODE4OA@@._V1_UX182_CR0,0,182,268_AL_.jpg"

		let red = Movie()
		red.title = "RED"
		red.year = 2010
		red.art = "http://ia.media-imdb.com/images/M/MV5BMzg2Mjg1OTk0NF5BMl5BanBnXkFtZTcwMjQ4MTA3Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg"

		let expendables = Movie()
		expendables.title = "The Expendables"
		expendables.year = 2010
		expendables.art = "http://ia.media-imdb.com/images/M/MV5BNTUwODQyNjM0NF5BMl5BanBnXkFtZTcwNDMwMTU1Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg"


		self.movies.append(fifthElement)
		self.movies.append(dieHard1)
		self.movies.append(gijoe)
		self.movies.append(red)
		self.movies.append(expendables)

	}

	public func toString() -> String {
		var out = [String]()

		for m in self.movies {
			do {
				out.append(try m.jsonEncodedString())
			} catch {
				print(error)
			}
		}
		return "[\(out.joined(separator: ","))]"
	}
}
