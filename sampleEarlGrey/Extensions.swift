//
//  Extensions.swift
//  sampleEarlGrey
//
//  Created by Rakesh on 04/04/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import UIKit

// UIColor extension
extension UIColor {
    
    static func rgb(red : CGFloat,green : CGFloat,blue : CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

// UIView extension
extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?, left : NSLayoutXAxisAnchor?, bottom : NSLayoutYAxisAnchor?,right : NSLayoutXAxisAnchor?,paddingTop : CGFloat,paddingLeft : CGFloat,paddingBottom : CGFloat, paddingRight : CGFloat,width : CGFloat,height : CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if(width != 0){
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if(height != 0){
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}

// UIViewController Extension

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

