//
//  ShadowView.swift
//  GroupChat
//
//  Created by Biswajit Banik on 11/19/17.
//  Copyright © 2017 Biswajit Banik. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
    
}
