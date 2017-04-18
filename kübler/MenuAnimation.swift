//
//  ViewController.swift
//  kübler
//
//  Created by Seannn! on 30/3/17.
//  Copyright © 2017 covve. All rights reserved.
//

import UIKit

var parentHeight : CGFloat? = nil

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



class mainMenuBG: UIViewController {
//MARK: - INIT
	@IBOutlet weak var linebg: UIImageView!
	@IBOutlet weak var bg1: UIImageView!
	@IBOutlet weak var bg2: UIImageView!
	@IBOutlet weak var bg3: UIImageView!
	@IBOutlet weak var bg4: UIImageView!
	
	var imgArray : [UIImageView?]? = nil
	
	var timerr : Timer?
	
	var lineBG: CGRect = CGRect(), one: CGRect = CGRect(),two: CGRect = CGRect(),three : CGRect = CGRect(),four : CGRect = CGRect()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imgArray = [bg1, bg2, bg3,bg4]
		imgArray?.forEach({ (imageview) in
			imageview?.alpha = 0
		})
		linebg.alpha = 0;
		parentHeight = self.view.frame.size.height
		
		bg1.addParallaxToView(amt: 25)
		bg2.addParallaxToView(amt: 10)
		bg3.addParallaxToView(amt: 35)
		bg4.addParallaxToView(amt: 5)
		
		timerr = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.dotSwitcher), userInfo: nil, repeats: true)
		
	}
	
	//stars effect animation
	func dotSwitcher () {
		let arr : [CGFloat] = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
		imgArray?.forEach({ (groupOfDots) in
			UIView.animate(withDuration: 0.5, animations: {
			groupOfDots?.alpha = arr[Int(arc4random()%10)]
			})
		})
	}
	
	override func viewDidAppear(_ animated: Bool) {
		one = bg1.frame
		two = bg2.frame
		three = bg3.frame
		four = bg4.frame
		lineBG = linebg.frame
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
			self.bg4.transform = CGAffineTransform.init(rotationAngle: 0.1 )

		}, completion: nil)
		//line
		UIView.animate(withDuration: 4, delay: 4.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			self.linebg.alpha = 1
		},  completion: nil)
	
}
	

	
//MARK: - callables
	
	func exitMenu() {
		UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			self.linebg.transform = CGAffineTransform.init(scaleX: 1, y: 1)
			self.linebg.transform = CGAffineTransform.init(rotationAngle: 0)
			self.imgArray?.forEach({ (imageView) in
				imageView?.transform = CGAffineTransform.init(rotationAngle : 0)
			})
		})
	}
	
	func movetoRandPosition() {
		UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			let arr : [CGFloat] = [0.0,2.2,-1.2,2.3,1.4,0.5,0.6,1.7,0.8,0.9,3.0]
			self.linebg.transform = CGAffineTransform.init(scaleX: 2, y: 2)
			self.linebg.transform = CGAffineTransform.init(rotationAngle: arr[Int(arc4random()%10)])
			self.imgArray?.forEach({ (imageView) in
				imageView?.transform = CGAffineTransform.init(rotationAngle : arr[Int(arc4random()%10)])
			})
		})
	}





}




