//
//  startVC.swift
//  kübler
//
//  Created by Seannn! on 5/4/17.
//  Copyright © 2017 kæle. All rights reserved.
//

import UIKit

	var bgView : mainMenuBG = mainMenuBG()

class startVC: UIViewController {

	var menuView : selectLevelMenu = selectLevelMenu()
	
	@IBOutlet weak var playB: UIButton!
	@IBOutlet weak var logo: UILabel!
	@IBOutlet weak var bgContainer: UIView!
	
	override var prefersStatusBarHidden: Bool{
		return true
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		logo.alpha = 0
		playB.alpha = 0
		
		playB.layer.borderWidth = 0.5
		playB.layer.borderColor = UIColor.white.cgColor
		playB.roundify15()
		
		bgView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menuBG") as! mainMenuBG
		self.addChildViewController(bgView)
		bgView.view.center = self.bgContainer.center
		self.bgContainer.addSubview(bgView.view)
		
		UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: { 
			self.logo.alpha = 1
			self.playB.alpha = 1
		}, completion: nil)
		
	}
	
	@IBAction func play(_ sender: Any) {
		playB.isEnabled = false
		UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
			self.logo.alpha = 0
			self.playB.alpha = 0
		}, completion: {(s) in
			self.presentSelectmenu()
		})
	}
	
	func presentSelectmenu () {
		menuView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menu") as! selectLevelMenu
		menuView.instanceofStart = self
		menuView.view.backgroundColor = UIColor.clear
		self.addChildViewController(menuView)
		menuView.view.alpha = 0
		menuView.view.center = self.view.center
		self.view.addSubview(menuView.view)
		UIView .animate(withDuration: 0.4) { 
			self.menuView.view.alpha = 1
		}
		
	}
	
	 func callbackMenu (){
		self.playB.isEnabled = true
		UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
			self.logo.alpha = 1
			self.playB.alpha = 1
		}, completion: {(s) in
		})
	}

}

class selectLevelMenu : UIViewController {
	
	@IBOutlet weak var backB: UIButton!
	@IBOutlet var buttonArray: [UIButton]!
	
	var instanceofStart : startVC?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bgView.moveIntoMenu()
		backB.roundifyCircle()
		backB.layer.borderWidth = 0.5
		backB.layer.borderColor = UIColor.white.cgColor
		var count : Double = 0
		buttonArray.forEach { (button) in
			button.layer.borderWidth = CGFloat(0.1 + count)
			count = count + 0.1
			button.layer.borderColor = UIColor.white.cgColor
		}
	}
	
	@IBAction func back(_ sender: Any) {
		self.view.removeFromSuperview()
		instanceofStart?.callbackMenu()
		bgView.exitMenu()
	}
	
}






























