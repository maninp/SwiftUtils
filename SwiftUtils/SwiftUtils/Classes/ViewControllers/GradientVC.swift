//
//  GradientVC.swift
//  SwiftUtils
//
//  Created by NPC on 07/09/18.
//  Copyright © 2018 NPC. All rights reserved.
//

import Foundation
import UIKit

class GradientVC : UIViewController{
    
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    private var bgView: GradientView = Utils.getGradientView(startColor: GradientVCColor.viewBgStartColor, endColor: GradientVCColor.viewBgEndColor)
    private var subview1BgView : GradientView?
    private var subview2BgView : GradientView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.frame = view.bounds
        bgView.cornerRadius = 0.0
        view.insertSubview(bgView, at: 0)
        self.navigationItem.largeTitleDisplayMode = .never
        setupGradient()
    }
    
    func setupGradient() {
        if subview1BgView == nil {
            subview1BgView = Utils.getGradientView(startColor: GradientVCColor.subview1BgStartColor, endColor: GradientVCColor.subview1BgEndColor)
            firstView.addSubview(subview1BgView!)
        }
        Utils.addShadowCornerRadius(firstView, radius: 16.0)
        
        if subview2BgView == nil {
            subview2BgView = Utils.getGradientView(startColor: GradientVCColor.subview2BgStartColor, endColor: GradientVCColor.subview2BgEndColor)
            secondView.addSubview(subview2BgView!)
        }
        Utils.addShadowCornerRadius(secondView, radius: 16.0)
    }
    
    
}
