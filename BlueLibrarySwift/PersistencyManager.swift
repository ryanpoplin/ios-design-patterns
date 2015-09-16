//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/16/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {

	private var albums = [Album]()
	
	override init() {

		let album1 = Album(title: "Best of Bowie",
			artist: "David Bowie",
			genre: "Pop",
			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png",
			year: "1992")
		
		let album2 = Album(title: "It's My Life",
			artist: "No Doubt",
			genre: "Pop",
			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png",
			year: "2003")
		
		let album3 = Album(title: "Nothing Like The Sun",
			artist: "Sting",
			genre: "Pop",
			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png",
			year: "1999")
		
		albums = [album1, album2, album3]
		
	}
	
	func getAlbums() -> [Album] {
		return albums
	}
	
	func addAlbum(album: Album, index: Int) {
		if albums.count >= index {
			albums.insert(album, atIndex: index)
		} else {
			albums.append(album)
		}
	}
	
	func deleteAlbumAtIndex(index: Int) {
		albums.removeAtIndex(index)
	}
	
}