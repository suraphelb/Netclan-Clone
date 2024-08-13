//
//  DesignableUITextField.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/15/23.
//

import UIKit

@IBDesignable class DesignableUITextField: UITextField {
    @IBInspectable var leftViewPadding: CGFloat = 20
    @IBInspectable var gapPadding: CGFloat = 10
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateLeftView()
        }
    }
    //    Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftViewPadding
        return textRect
    }
    
    private var textPadding: UIEdgeInsets {
        let p: CGFloat = leftViewPadding + gapPadding + (leftView?.frame.width ?? 0)
        return UIEdgeInsets(top: 0, left: p, bottom: 0, right: 5)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    
    private func updateLeftView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x:0, y:0, width:20, height:20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = .lightGray
            leftView = imageView
        } else {
            leftViewMode = .never
            leftView = nil
        }
    }
    
}
