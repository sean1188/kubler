//
//  ViewController.swift
//  kübler
//
//  Created by Seannn! on 30/3/17.
//  Copyright © 2017 kæle. All rights reserved.
//

import UIKit

var parentHeight : CGFloat? = nil
class mainMenuBG: UIViewController {
	
	@IBOutlet weak var linebg: UIImageView!
	@IBOutlet weak var bg1: UIImageView!
	@IBOutlet weak var bg2: UIImageView!
	@IBOutlet weak var bg3: UIImageView!
	@IBOutlet weak var bg4: UIImageView!
	
	var one: CGRect = CGRect(),two: CGRect = CGRect(),three : CGRect = CGRect(),four : CGRect = CGRect()
	
	override func viewDidLoad() {
		bg1.alpha = 0
		bg2.alpha = 0
		bg3.alpha = 0
		bg4.alpha = 0
		linebg.alpha = 0;
		parentHeight = self.view.frame.size.height
		
		bg1.addParallaxToView(amt: 25)
		bg2.addParallaxToView(amt: 10)
		bg3.addParallaxToView(amt: 35)
		bg4.addParallaxToView(amt: 5)
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		one = bg1.frame
		two = bg2.frame
		three = bg3.frame
		four = bg4.frame
		animateIn()
	}
	
	func animateIn(){
		//displace and reveal
		bg1.alpha = 0.9
		bg2.alpha = 0.6
		bg3.alpha = 0.3
		bg4.alpha = 0.4
		bg1.displaceView()
		bg2.displaceView()
		bg3.displaceView()
		bg4.displaceView()
		
		//animate in at different rates
		//phase
		UIView.animate(withDuration: 4, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
			self.bg1.frame = self.one
			self.bg1.transform = CGAffineTransform.init(rotationAngle: -0.1)
		}, completion: nil)
		UIView.animate(withDuration: 3.6, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
			self.bg2.frame = self.two
			self.bg2.transform = CGAffineTransform.init(rotationAngle: 0.1)

		}, completion: nil)
		UIView.animate(withDuration: 5.5, delay: 0.6, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
			self.bg3.frame = self.three
			self.bg3.transform = CGAffineTransform.init(rotationAngle: -0.1)
		}, completion: nil)
		UIView.animate(withDuration: 4, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
			self.bg4.frame = self.four
			self.bg4.transform = CGAffineTransform.init(rotationAngle: 1 )

		}, completion: nil)
		//line
		UIView.animate(withDuration: 4, delay: 7, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			self.linebg.alpha = 1
		},  completion: {(s) in
	
		})
	
}
}

private extension UIView {
	func displaceView(){
		let parentheight = parentHeight!
		self.frame = CGRect.init(x: self.frame.origin.x, y:parentheight
			, width: self.frame.size.width, height: self.frame.size.height)
	}
	
	
	func addParallaxToView(amt: Int) {
		let amount = amt
		
		let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
		horizontal.minimumRelativeValue = -amount
		horizontal.maximumRelativeValue = amount
		
		let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
		vertical.minimumRelativeValue = -amount
		vertical.maximumRelativeValue = amount
		
		let group = UIMotionEffectGroup()
		group.motionEffects = [horizontal, vertical]
		self.addMotionEffect(group)
	}
}

