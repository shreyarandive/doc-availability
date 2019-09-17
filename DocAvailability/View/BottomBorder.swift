//
//  BottomBorder.swift
//  DocAvailability
//
//  Created by Shreya Randive on 9/17/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class BottomBorder: UIView {

    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView() {
        let border = CALayer()
        let thickness: CGFloat = 0.5
        border.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        let screen = UIScreen.main.bounds
        border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: screen.height + screen.width, height: thickness)
        layer.addSublayer(border)
    }

}
