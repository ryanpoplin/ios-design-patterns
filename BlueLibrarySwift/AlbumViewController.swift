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

class AlbumViewController: UIViewController {

	private var allAlbums = [Album]()
	private var currentAlbumData: (titles: [String], values: [String])!
	private var currentAlbumIndex = 0
	
	// Controller: The controller is the mediator that coordinates all the work. It accesses the data from the model and displays it with the views, listens to events and manipulates the data as necessary.
	
	@IBOutlet var dataTable: UITableView!
	@IBOutlet var toolbar: UIToolbar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.translucent = false
		currentAlbumIndex = 0
		allAlbums = LibraryAPI.sharedInstance.getAlbums()
		dataTable.delegate = self
		dataTable.dataSource = self
		dataTable.backgroundView = nil
		view.addSubview(dataTable!)
		self.showDataForAlbum(currentAlbumIndex)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func showDataForAlbum(albumIndex: Int) {
		if albumIndex < allAlbums.count && albumIndex > -1 {
			let album = allAlbums[albumIndex]
			currentAlbumData = album.ae_tableRepresentation()
		} else {
			currentAlbumData = nil
		}
		dataTable!.reloadData()
	}
	
	func didGetAlbums(albums: [Album]) {
		
	}

}

extension AlbumViewController: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let albumData = currentAlbumData {
			return albumData.titles.count
		} else {
			return 0
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
		if let albumData = currentAlbumData {
			cell.textLabel!.text = albumData.titles[indexPath.row]
			cell.detailTextLabel!.text = albumData.values[indexPath.row]
		}
		return cell
	}
	
}

extension AlbumViewController: UITableViewDelegate { }