//
//  UIColor + Extancions.swift
//  TIC-TAC-TOE
//
//  Created by apple on 9/30/24.
//

import UIKit

extension UIFont {
    
    // Шрифт Black Italic
    static func customBlackItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYBLACKITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Heavy Italic
    static func customHeavyItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYHEAVYITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Bold
    static func customBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYBOLD", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    // Шрифт Bold
    static func customSemiBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYBOLD", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    // Шрифт Semi Bold Italic
    static func customSemiBoldItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYSEMIBOLDITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Medium
    static func customMediumFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYMEDIUM", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    // Шрифт Light Italic
    static func customLightItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYLIGHTITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Thin Italic
    static func customThinItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYTHINITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Ultra Light Italic
    static func customUltraLightItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYULTRALIGHTITALIC", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    // Шрифт Regular
    static func customRegularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SFPRODISPLAYREGULAR", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
