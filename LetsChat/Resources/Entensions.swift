//
//  Entensions.swift
//  LetsChat
//
//  Created by Omotayo on 15/03/2022.
//

import Foundation
import UIKit

extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    public var height: CGFloat {
        return self.frame.size.height
    }
    public var top: CGFloat {
        return self.frame.origin.y
    }
    public var bottom: CGFloat {
        return self.frame.origin.y + height
    }
    public var left: CGFloat {
        return self.frame.origin.x
    }
    public var right: CGFloat {
        return self.frame.origin.x + width
    }
    
    func addSubviews(views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
