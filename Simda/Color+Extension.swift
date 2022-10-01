//
//  Color+Extension.swift
//  Simda
//
//  Created by 전지민 on 2022/10/02.
//

import UIKit

extension UIColor {
    static var White: UIColor {
        guard let color = UIColor(named: "White") else { return .label }
        return color
    }
    
    static var Gray: UIColor {
        guard let color = UIColor(named: "Gray") else { return .label }
        return color
    }
    
    static var DarkGray: UIColor {
        guard let color = UIColor(named: "DarkGray") else { return .label }
        return color
    }
    
    static var Background1: UIColor {
        guard let color = UIColor(named: "Background1") else { return .label }
        return color
    }
    
    static var Background2: UIColor {
        guard let color = UIColor(named: "Background2") else { return .label }
        return color
    }
    
    static var Main: UIColor {
        guard let color = UIColor(named: "Main") else { return .label }
        return color
    }
    
    static var Red: UIColor {
        guard let color = UIColor(named: "Red") else { return .label }
        return color
    }
    
    static var Orange: UIColor {
        guard let color = UIColor(named: "Orange") else { return .label }
        return color
    }
    
    static var Yellow: UIColor {
        guard let color = UIColor(named: "Yellow") else { return .label }
        return color
    }
    
    static var Green: UIColor {
        guard let color = UIColor(named: "Green") else { return .label }
        return color
    }
}
