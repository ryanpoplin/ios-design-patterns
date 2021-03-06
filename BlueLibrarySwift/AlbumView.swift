//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Byrdann Fox on 9/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class AlbumView: UIView {

	// View: The objects that are in charge of the visual representation of the Model and the controls the user can interact with; basically, all the UIView-derived objects.
	
	private var coverImage: UIImageView!
	private var indicator: UIActivityIndicatorView!
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		commonInit()
	}
	
	init(frame: CGRect, albumCover: String) {
		super.init(frame: frame)
		commonInit()
	}
	
	func commonInit() {
		backgroundColor = UIColor.blackColor()
		coverImage = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
		addSubview(coverImage)
		indicator = UIActivityIndicatorView()
		indicator.center = center
		indicator.activityIndicatorViewStyle = .WhiteLarge
		indicator.startAnimating()
		addSubview(indicator)
	}
	
	func highlightAlbum(didHighlightView didHighlightView: Bool) {
		if didHighlightView == true {
			backgroundColor = UIColor.whiteColor()
		} else {
			backgroundColor = UIColor.blackColor()
		}
	}
	
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}