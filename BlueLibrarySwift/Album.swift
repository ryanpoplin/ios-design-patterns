//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class Album: NSObject {

	// Model: The object that holds your application data and defines how to manipulate it.
	
	var title: String!
	var artist: String!
	var genre: String!
	var coverUrl: String!
	var year: String!
	
	init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
		super.init()
		self.title = title
		self.artist = artist
		self.genre = genre
		self.coverUrl = coverUrl
		self.year = year
	}
	
	override var description: String {
		return "title: \(title)" +
			   "artist: \(artist)" +
			   "genre: \(genre)" +
			   "coverUrl: \(coverUrl)" +
			   "year: \(year)"
	}
	
}