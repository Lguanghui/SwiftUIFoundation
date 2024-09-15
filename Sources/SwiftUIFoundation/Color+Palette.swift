//
//  Color+Palette.swift
//  SwiftUIFoundation
// 
//  Created by 梁光辉 on 2024/9/14.
//  Copyright © 2024 Guanghui Liang. All rights reserved.
//

import Foundation
import SwiftUI

public extension Color {
    // MARK: - Black
    static let black900: Color = .init(RGBAHex: 0x000000)
    static let black800: Color = .init(RGBAHex: 0x333333)
    static let black600: Color = .init(RGBAHex: 0x666666)
    static let black400: Color = .init(RGBAHex: 0x999999)
    
    // MARK: - Dark
    static let dark500: Color = .init(RGBAHex: 0x131214)
    static let dark400: Color = .init(RGBAHex: 0x1C1B1D)
    static let darkBlack: Color = .init(RGBAHex: 0x222222)
    
    // MARK: - Light
    static let light400: Color = .init(RGBAHex: 0xEFEFEF)
    static let light500: Color = .init(RGBAHex: 0xFAFAFA)
    
    // MARK: - White
    static let white400: Color = .init(RGBAHex: 0xFFFFFF).opacity(0.38)
    static let white600: Color = .init(RGBAHex: 0xFFFFFF).opacity(0.6)
    static let white800: Color = .init(RGBAHex: 0xFFFFFF).opacity(0.87)
    static let white900: Color = .init(RGBAHex: 0xFFFFFF)
    
    // MARK: - Warning
    static let warning100: Color = .init(RGBAHex: 0xFFFBEB)
    static let warning400: Color = .init(RGBAHex: 0xFEDB50)
    static let warning500: Color = .init(RGBAHex: 0xFED11E)
    static let warning600: Color = .init(RGBAHex: 0xD7B11A)
    static let warning900: Color = .init(RGBAHex: 0x3D2D00)
    
    // MARK: - Danger
    static let danger100: Color = .init(RGBAHex: 0xFFF3F2)
    static let danger400: Color = .init(RGBAHex: 0xFF736A)
    static let danger500: Color = .init(RGBAHex: 0xFF473D)
    static let danger600: Color = .init(RGBAHex: 0xD9382D)
    static let danger900: Color = .init(RGBAHex: 0x66140C)
    
    // MARK: - Success
    static let success100: Color = .init(RGBAHex: 0xE0FDF0)
    static let success400: Color = .init(RGBAHex: 0x3BDA9E)
    static let success500: Color = .init(RGBAHex: 0x24C789)
    static let success600: Color = .init(RGBAHex: 0x14B479)
    static let success900: Color = .init(RGBAHex: 0x073B27)
    
    // MARK: - Blue
    static let blue100: Color = .init(RGBAHex: 0xEAF4FF)
    static let blue200: Color = .init(RGBAHex: 0xD3E6FC)
    static let blue300: Color = .init(RGBAHex: 0xABCAFA)
    static let blue400: Color = .init(RGBAHex: 0x83B1FA)
    static let blue500: Color = .init(RGBAHex: 0x5F9BFA)
    static let blue600: Color = .init(RGBAHex: 0x4982DB)
    static let blue700: Color = .init(RGBAHex: 0x376ABD)
    static let blue800: Color = .init(RGBAHex: 0x27559E)
    static let blue900: Color = .init(RGBAHex: 0x194180)
    
    // MARK: - Purple
    static let purple100: Color = .init(RGBAHex: 0xEEE8FE)
    static let purple200: Color = .init(RGBAHex: 0xDDD1FD)
    static let purple300: Color = .init(RGBAHex: 0xBCA6F8)
    static let purple400: Color = .init(RGBAHex: 0xA081F2)
    static let purple500: Color = .init(RGBAHex: 0x8964E8)
    static let purple600: Color = .init(RGBAHex: 0x764EDA)
    static let purple700: Color = .init(RGBAHex: 0x673EC9)
    static let purple800: Color = .init(RGBAHex: 0x5931B3)
    static let purple900: Color = .init(RGBAHex: 0x4D289C)
    
    // MARK: - Red
    static let red100: Color = .init(RGBAHex: 0xFFEBED)
    static let red200: Color = .init(RGBAHex: 0xFFD6DA)
    static let red300: Color = .init(RGBAHex: 0xFFAAB1)
    static let red400: Color = .init(RGBAHex: 0xFF848D)
    static let red500: Color = .init(RGBAHex: 0xFF666F)
    static let red600: Color = .init(RGBAHex: 0xEC4F5B)
    static let red700: Color = .init(RGBAHex: 0xD43E4D)
    static let red800: Color = .init(RGBAHex: 0xB83143)
    static let red900: Color = .init(RGBAHex: 0x9C283A)
    
    // MARK: - Green
    static let green100: Color = .init(RGBAHex: 0xEDFAD2)
    static let green200: Color = .init(RGBAHex: 0xDAF5A6)
    static let green300: Color = .init(RGBAHex: 0xC6ED82)
    static let green400: Color = .init(RGBAHex: 0xB3E166)
    static let green500: Color = .init(RGBAHex: 0xA4D44C)
    static let green600: Color = .init(RGBAHex: 0x96C238)
    static let green700: Color = .init(RGBAHex: 0x85AC29)
    static let green800: Color = .init(RGBAHex: 0x75941F)
    static let green900: Color = .init(RGBAHex: 0x60830B)
    
    // MARK: - Yellow
    static let yellow100: Color = .init(RGBAHex: 0xFFF5E8)
    static let yellow200: Color = .init(RGBAHex: 0xFFEBD0)
    static let yellow300: Color = .init(RGBAHex: 0xFFD4A1)
    static let yellow400: Color = .init(RGBAHex: 0xFFC179)
    static let yellow500: Color = .init(RGBAHex: 0xFFB15A)
    static let yellow600: Color = .init(RGBAHex: 0xF3A143)
    static let yellow700: Color = .init(RGBAHex: 0xE59334)
    static let yellow800: Color = .init(RGBAHex: 0xD48629)
    static let yellow900: Color = .init(RGBAHex: 0xC27A23)
    
    // MARK: - Orange
    static let orange100: Color = .init(RGBAHex: 0xFFEFE7)
    static let orange200: Color = .init(RGBAHex: 0xFADACB)
    static let orange300: Color = .init(RGBAHex: 0xFABDA2)
    static let orange400: Color = .init(RGBAHex: 0xF9A078)
    static let orange500: Color = .init(RGBAHex: 0xF5824E)
    static let orange600: Color = .init(RGBAHex: 0xE86832)
    static let orange700: Color = .init(RGBAHex: 0xDA501A)
    static let orange800: Color = .init(RGBAHex: 0xCD3904)
    static let orange900: Color = .init(RGBAHex: 0xBF3000)
    
    // MARK: - Apple System
    static let appleBlue: Color = .init(RGBAHex: 0x3B83F7)
    
    // MARK: - Image Place Holder
    static let imagePlaceHolderColor: Color = .init(RGBAHex: 0xCCCCCC)
}
