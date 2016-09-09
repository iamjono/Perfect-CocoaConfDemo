//
//  Utilities.swift
//  CCDC-MovieList-iOS
//
//  Created by Jonathan Guthrie on 2016-09-05.
//  Copyright © 2016 PerfectlySoft. All rights reserved.
//

import Foundation

func getURL(_ url: String) -> String {
	var out = ""
	let url = URL(string: url)
	let task = URLSession.shared.dataTask(with: url! as URL) { data, response, error in
		guard let data = data, error == nil else { return }
		out = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String
	}
	task.resume()
	while out.characters.count == 0 {
		// continue. huge cheat because alamofire does not swift 3 yet
	}
	return out
}
