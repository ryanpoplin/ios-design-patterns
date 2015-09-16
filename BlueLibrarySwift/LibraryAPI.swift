//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/16/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {

	// The Facade design pattern provides a single interface to a complex subsystem. Instead of exposing the user to a set of classes and their APIs, you only expose one simple unified API.
	
	private let persistencyManager: PersistencyManager
	private let isOnline: Bool
	
	override init() {
		persistencyManager = PersistencyManager()
		// mock server, unless I want to plug up Loopi-API
		isOnline = false
		super.init()
	}
	
	func getAlbums() -> [Album] {
		httpClient.mockGetRequest()
		return persistencyManager.getAlbums()
	}
	
	func addAlbum(album: Album, index: Int) {
		persistencyManager.addAlbum(album, index: index)
		if isOnline {
			// use Loopi-API...
			httpClient.postRequest("", body: album.description)
		}
	}
	
	func deleteAlbum(index: Int) {
		persistencyManager.deleteAlbumAtIndex(index)
		if isOnline {
			httpClient.postRequest("", body: "\(index)")
		}
	}
	
	// The Singleton design pattern ensures that only one instance exists for a given class and that there’s a global access point to that instance. It usually uses lazy loading to create the single instance when it’s needed the first time.
	// it’s easier to implement a thread-safe access to a single shared resource, such as a configuration file, than to have many class modifying the configuration file possibly at the same time.
	
	// Below will never call again once created...
	
	// computed type prop.
	// can call without having to instantiate it...
	class var sharedInstance: LibraryAPI {
		struct Singleton {
			// only exists once, and not created unless it's needed.
			static let instance = LibraryAPI()
		}
		return Singleton.instance
	}
	
}

// FIXME: - what's a good pattern to get access to this instance?
let httpClient = HTTPClient()

