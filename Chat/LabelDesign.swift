//
//  LabelDesign.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/17.
//

import UIKit

@IBDesignable class LabelDesign: UILabel {
    
    @IBInspectable var topPadding: CGFloat = 0.0
    @IBInspectable var bottomPadding: CGFloat = 0.0
    @IBInspectable var leftPadding: CGFloat = 0.0
    @IBInspectable var rightPadding: CGFloat = 0.0
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.topPadding = padding.top
        self.bottomPadding = padding.bottom
        self.leftPadding = padding.left
        self.rightPadding = padding.right
        self.cornerRadius = layer.cornerRadius
        
    }
    
    override func drawText(in rect: CGRect) {
        let padding = UIEdgeInsets.init(top: topPadding, left:leftPadding, bottom:bottomPadding, right:rightPadding)//순서중요
        self.layer.cornerRadius = cornerRadius
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += self.leftPadding + self.rightPadding
        contentSize.height += self.topPadding + self.bottomPadding
        return contentSize
    }
    
    
}
