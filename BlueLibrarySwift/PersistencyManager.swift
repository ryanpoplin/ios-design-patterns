//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/16/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject, AlbumDataDelegate {

	private var musicAlbums = [Album]()
	
	override init() {
		
		super.init()
		
		// FIXME: - 
		httpClient.delegate = self
		
//		let album1 = Album(title: "Best of Bowie",
//			artist: "David Bowie",
//			genre: "Pop",
//			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png",
//			year: "1992")
//		
//		let album2 = Album(title: "It's My Life",
//			artist: "No Doubt",
//			genre: "Pop",
//			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png",
//			year: "2003")
//		
//		let album3 = Album(title: "Nothing Like The Sun",
//			artist: "Sting",
//			genre: "Pop",
//			coverUrl: "http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png",
//			year: "1999")
		
		// musicAlbums = [album1, album2, album3]
	}
	
	// MARK: - AlbumDataDelegate Method 
	
	func didGetAlbums(albums: [Album]) {
		musicAlbums = albums
	}
	
	// MARK: -
	
	func getAlbums() -> [Album] {
		return musicAlbums
	}
	
	func addAlbum(album: Album, index: Int) {
		if musicAlbums.count >= index {
			musicAlbums.insert(album, atIndex: index)
		} else {
			musicAlbums.append(album)
		}
	}
	
	func deleteAlbumAtIndex(index: Int) {
		musicAlbums.removeAtIndex(index)
	}
	
}