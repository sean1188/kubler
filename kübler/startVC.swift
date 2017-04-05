//
//  startVC.swift
//  kübler
//
//  Created by Seannn! on 5/4/17.
//  Copyright © 2017 kæle. All rights reserved.
//

import UIKit

class startVC: UIViewController {

	var bgView : mainMenuBG = mainMenuBG()
	@IBOutlet weak var playB: UIButton!
	@IBOutlet weak var logo: UILabel!
	@IBOutlet weak var bgContainer: UIView!
	
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
		}, completion: nil)
		bgView.moveIntoMenu()
	}

}

class selectLevelMenu : UIViewController {
	
	@IBOutlet var buttonArray: [UIButton]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		var count : Double = 0
		buttonArray.forEach { (button) in
			button.layer.borderWidth = CGFloat(0.5 + count)
			count = count + 0.1
			button.layer.borderColor = UIColor.white.cgColor
		}
	}
	
	
}






























