//
//  Utils.swift
//  SwiftUtils
//
//  Created by NPC on 07/09/18.
//  Copyright © 2018 NPC. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    class func loadVC(storyBoardName: String, identifer : String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifer)
    }
    
    class func getGradientView(startColor : Int, endColor : Int) -> GradientView {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topColor = UIColor(hex: startColor)
        view.bottomColor = UIColor(hex: endColor)
        return view
    }
    
    class func addShadowCornerRadius(_ view : UIView, radius : CGFloat) {
        view.dropShadow()
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
}
