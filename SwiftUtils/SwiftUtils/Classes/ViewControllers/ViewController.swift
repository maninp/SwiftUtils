//
//  ViewController.swift
//  SwiftUtils
//
//  Created by NPC on 06/09/18.
//  Copyright © 2018 NPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBtn()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGradientBtn() {
        gradientBtn.dropShadow()
        gradientBtn.layer.cornerRadius = 8.0
        gradientBtn.layer.masksToBounds = true
    }

    @IBAction func gradientTapped(_ sender: Any) {
        let gradientVC = Utils.loadVC(storyBoardName: StoryboardConstants.Name.Utility, identifer: StoryboardConstants.Identifier.GradientVC)
        self.navigationController?.pushViewController(gradientVC, animated: true)
    }
}

