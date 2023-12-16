//
//  Color+Hex.swift
//  
//
//  Created by 梁光辉 on 2022/3/19.
//

import Foundation
import SwiftUI

extension Color {
    
    /// get Color from RGBA or RGB hex
    /// - Parameter hex: RGBA / RGB hex. Alpha is optional. e.g. `0xF6F6F6`, `0xF6F6F6FF`
    /// - Returns: a Color from given hex
    public static func color(fromRGBAHex hex: UInt) -> Color {
        return Color(RGBAHex: hex)
    }
    
    /// get Color from ARGB or RGB hex
    /// - Parameter hex: ARGB / RGB hex. Alpha is optional. e.g. `0xF6F6F6`, `0xFFF6F6F6`
    /// - Returns: a Color from given hex
    public static func color(fromARGBHex hex: UInt) -> Color {
        return Color(ARGBHex: hex)
    }
    
    /// get Color from RGBA or RGB string
    /// - Parameter rgba: RGBA / RGB string. Alpha is optional. e.g. `"#F6F6F6"`, `"#F6F6F6FF"`
    /// - Returns: a Color from given RGBA str
    public static func color(withRGBAHex rgba: String) -> Color? {
        return Color(RGBAHexStr: rgba)
    }
    
    
    /// get Color from ARGB or RGB string
    /// - Parameter argb: ARGB / RGB string. e.g. `"#F6F6F6"`, `"#FFF6F6F6"`
    /// - Returns: a Color from ARGB str
    public static func color(withARGBHex argb: String) -> Color? {
        return Color(ARGBHexStr: argb)
    }
}

extension Color {
    
    /// initialize Color from RGBA or RGB hex
    /// - Parameter hex: RGBA / RGB Hex. Alpha is optional. e.g. `0xF6F6F6`, `0xF6F6F6FF`
    public init(RGBAHex hex: UInt) {
        var red: Double = 1.0
        var green: Double = 1.0
        var blue: Double = 1.0
        var alpha: Double = 1.0
        
        if hex >= 0 {
            if hex <= 0xFFFFFF {
                // no Alpha. e.g. 0xF6F6F6
                red = Double(((hex & 0xFF0000) >> 16)) / 255.0
                green = Double(((hex & 0xFF00) >> 8)) / 255.0
                blue = Double((hex & 0xFF)) / 255.0
            } else {
                // has Alpha. e.g. 0xF6F6F6FF
                red = Double((hex & 0xFF000000) >> 24) / 255.0
                green = Double((hex & 0xFF0000) >> 16) / 255.0
                blue = Double((hex & 0xFF00) >> 8) / 255.0
                alpha = Double((hex & 0xFF)) / 255.0
            }
        }
        self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    /// initialize Color from ARGB or RGB hex
    /// - Parameter hex: ARGB / RGB hex. Alpha is optional. e.g. `0xF6F6F6`, `0xFFF6F6F6`
    public init(ARGBHex hex: UInt) {
        var red: Double = 1.0
        var green: Double = 1.0
        var blue: Double = 1.0
        var alpha: Double = 1.0
        
        if hex > 0 {
            if hex <= 0xFFFFFF {
                // no Alpha. e.g. 0xF6F6F6
                red = Double(((hex & 0xFF0000) >> 16)) / 255.0
                green = Double(((hex & 0xFF00) >> 8)) / 255.0
                blue = Double((hex & 0xFF)) / 255.0
            } else {
                // has Alpha. e.g. 0xFFF6F6F6
                alpha = Double((hex & 0xFF000000) >> 24) / 255.0
                red = Double((hex & 0xFF0000) >> 16) / 255.0
                green = Double((hex & 0xFF00) >> 8) / 255.0
                blue = Double((hex & 0xFF)) / 255.0
            }
        }
        self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    /// initialize Color from RGBA or RGB string
    /// - Parameter rgba: RGBA / RGB string. Alpha is optional. e.g. `"#F6F6F6"`, `"#F6F6F6FF"`
    public init?(RGBAHexStr rgba: String) {
        if rgba.isEmpty {
            return nil
        } else {
            var red: Double = 1.0
            var green: Double = 1.0
            var blue: Double = 1.0
            var alpha: Double = 1.0
            var hex = rgba
            
            if hex.hasPrefix("#") {
                let startIndex = hex.index(hex.startIndex, offsetBy: 1)
                hex = String(hex[startIndex..<hex.endIndex])
            }
            let scanner = Scanner.init(string: hex)
            var hexValue: UInt64 = 0
            if scanner.scanHexInt64(&hexValue) {
                switch hex.count {
                case 3:
                    red = Double((hexValue & 0xF00) >> 8) / 15.0
                    green = Double((hexValue & 0x0F0) >> 4) / 15.0
                    blue = Double(hexValue & 0x00F) / 15.0
                case 4:
                    red = Double((hexValue & 0xF000) >> 12) / 15.0
                    green = Double((hexValue & 0x0F00) >> 8) / 15.0
                    blue = Double((hexValue & 0x00F0) >> 4) / 15.0
                    alpha = Double(hexValue & 0x000F) / 15.0
                case 6:
                    red = Double((hexValue & 0xFF0000) >> 16) / 255.0
                    green = Double((hexValue & 0x00FF00) >> 8) / 255.0
                    blue = Double(hexValue & 0x0000FF) / 255.0
                case 8:
                    red = Double((hexValue & 0xFF000000) >> 24) / 255.0
                    green = Double((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue = Double((hexValue & 0x0000FF00) >> 8) / 255.0
                    alpha = Double(hexValue & 0x000000FF) / 255.0
                default:
                    return nil
                }
            } else {
                return nil
            }
            self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
        }
    }
    
    /// initialize Color from ARGB or RGB string
    /// - Parameter argb: ARGB / RGB string, e.g. `"#F6F6F6"`, `"#FFF6F6F6"`
    public init?(ARGBHexStr argb: String) {
        if argb.count == 0 {
            return nil
        } else {
            var alpha: Double = 1.0
            var red: Double = 1.0
            var green: Double = 1.0
            var blue: Double = 1.0
            var hex = argb
            
            if hex.hasPrefix("#") {
                let startIndex = hex.index(hex.startIndex, offsetBy: 1)
                hex = String(hex[startIndex..<hex.endIndex])
            }
            let scanner = Scanner.init(string: hex)
            var hexValue: UInt64 = 0
            if scanner.scanHexInt64(&hexValue) {
                switch hex.count {
                case 3:
                    red = Double((hexValue & 0xF00) >> 8) / 15.0
                    green = Double((hexValue & 0x0F0) >> 4) / 15.0
                    blue = Double(hexValue & 0x00F) / 15.0
                case 4:
                    alpha = Double((hexValue & 0xF000) >> 12) / 15.0
                    red = Double((hexValue & 0x0F00) >> 8) / 15.0
                    green = Double((hexValue & 0x00F0) >> 4) / 15.0
                    blue = Double(hexValue & 0x000F) / 15.0
                case 6:
                    red = Double((hexValue & 0xFF0000) >> 16) / 255.0
                    green = Double((hexValue & 0x00FF00) >> 8) / 255.0
                    blue = Double(hexValue & 0x0000FF) / 255.0
                case 8:
                    alpha = Double((hexValue & 0xFF000000) >> 24) / 255.0
                    red = Double((hexValue & 0x00FF0000) >> 16) / 255.0
                    green = Double((hexValue & 0x0000FF00) >> 8) / 255.0
                    blue = Double(hexValue & 0x000000FF) / 255.0
                default:
                    return nil
                }
            } else {
                return nil
            }
            self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
        }
    }
}

#Preview{
    VStack {
        Rectangle()
            .background(Color(RGBAHex: 0xFF0000))
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHex: 0xFF000000))
            .frame(height: 50)
        Rectangle()
            .background(Color.red)
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#FF0000"))
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#F00"))
            .frame(height: 50)
        
        
        Rectangle()
            .background(Color(RGBAHex: 0x0000FF))
            .frame(height: 50)
        Rectangle()
            .background(Color.blue)
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#0000FF"))
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#00F"))
            .frame(height: 50)
        
        Rectangle()
            .background(Color(RGBAHex: 0x00FF00))
            .frame(height: 50)
        Rectangle()
            .background(Color.green)
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#00FF00"))
            .frame(height: 50)
        Rectangle()
            .background(Color(RGBAHexStr: "#0F0"))
            .frame(height: 50)
        
        
    }
}
