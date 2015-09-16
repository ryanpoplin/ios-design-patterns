//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/16/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import Foundation

// The Decorator pattern dynamically adds behaviors and responsibilities to an object without modifying its code. It’s an alternative to subclassing where you modify a class’s behavior by wrapping it with another object.

extension Album {
	func ae_tableRepresentation() -> (titles: [String], values: [String]) {
		return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
	}
}