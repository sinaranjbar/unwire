//
//  UIView+LoadFromNib.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib(named: String? = nil) -> Self? {
        let name = named ?? "\(Self.self)"
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
            else { return nil}
        guard let view = nib.first as? Self
            else { return nil}
        return view
    }
}
