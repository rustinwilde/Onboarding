//
//  View&Extension.swift
//  Onboarding
//
//  Created by Rustin Wilde on 09.03.23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

