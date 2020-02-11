//
//  TipLabel.swift
//  QuickTip
//
//  Created by Jon Corn on 2/11/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class TipLabel: UILabel {
    override func awakeFromNib() {
        setupViews()
    }
    
    func setupViews() {
        self.textColor = .white
        updateFont(font: FontName.Neon)
    }
    
    func updateFont(font: String) {
        let size = self.font.pointSize
        self.font = UIFont(name: font, size: size)
    }
}
