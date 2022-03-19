//
//  File.swift
//  
//
//  Created by 梁光辉 on 2022/3/19.
//

import Foundation
import SwiftUI

extension Color {
    /// 获取颜色，默认透明度为1.0
    public static func gh_color(fromHex hex: UInt) -> Color {
        return Self.gh_color(fromHex: hex, opacity: 1.0)
    }
    
    /// 获取颜色，可指定透明度
    public static func gh_color(fromHex hex: UInt, opacity: Double) -> Color {
        return Self.init(.displayP3,
                         red: Double(((hex & 0xFF0000) >> 16)) / 255.0,
                         green: Double(((hex & 0xFF00) >> 8)) / 255.0,
                         blue: Double((hex & 0xFF)) / 255.0,
                         opacity: opacity)
    }
    
    /// 从字符串中获取颜色，其中 alpha 通道可有可无
    public static func gh_color(withRGBAHex rgba: String) -> Color? {
        if rgba.count == 0 {
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
            return Self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
        }
    }
    
    /// 从字符串中获取颜色，其中 alpha 通道在第一位（alpha 通道可有可无）
    public static func gh_color(withARGBHex argb: String) -> Color? {
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
            return Self.init(.displayP3, red: red, green: green, blue: blue, opacity: alpha)
        }
    }
}

