/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

protocol AlbumDataDelegate: NSObjectProtocol {
	func didGetAlbums(albums: [Album])
}

public class HTTPClient {
	
	var delegate: AlbumDataDelegate?
	
	func mockGetRequest() {
		
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
	
		delegateAlbums([album1, album2, album3])
	
	}
	
	func getRequest(url: String) -> (AnyObject) {
		return NSData()
	}
	
	func postRequest(url: String, body: String) -> (AnyObject) {
		return NSData()
	}
	
	func downloadImage(url: String) -> (UIImage) {
		let aUrl = NSURL(string: url)
		let data = NSData(contentsOfURL: aUrl!)
		let image = UIImage(data: data!)
		return image!
	}
	
	func delegateAlbums(albums: [Album]) {
		if delegate != nil {
			delegate?.didGetAlbums(albums)
		} else {
			print("The delegate is nil...")
		}
	}
	
}