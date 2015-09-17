//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

public class Album: NSObject {

	// Model: The object that holds your application data and defines how to manipulate it.
	
	// if these properties should be privatized, and they're not because an extension needs them what's up?
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
	
	override public var description: String {
		return "title: \(title)" +
			   "artist: \(artist)" +
			   "genre: \(genre)" +
			   "coverUrl: \(coverUrl)" +
			   "year: \(year)"
	}
	
}