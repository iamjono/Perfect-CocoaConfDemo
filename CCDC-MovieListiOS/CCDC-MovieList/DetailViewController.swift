//
//  DetailViewController.swift
//  CCDC-MovieList
//
//  Created by Jonathan Guthrie on 2016-09-02.
//  Copyright © 2016 PerfectlySoft. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!
	@IBOutlet var artwork: UIImageView!
	@IBOutlet var year: UILabel!

	func configureView() {
		if let detail = self.detailItem {
			if let label = self.detailDescriptionLabel {
				label.text = detail.title
			}
			if let y = self.year {
				y.text = String(detail.year)
			}
			if let art = self.artwork {
				art.setImageFromURl(stringImageUrl: detail.art)
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	var detailItem: Movie? {
		didSet {
		    self.configureView()
		}
	}
}

extension UIImageView{

	func setImageFromURl(stringImageUrl url: String){

		if let url = NSURL(string: url) {
			if let data = NSData(contentsOf: url as URL) {
				self.image = UIImage(data: data as Data)
			}
		}
	}
}
