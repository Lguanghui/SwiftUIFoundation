//
//  TagViewModifier.swift
//  SwiftUIFoundation 
// 
//  Created by 梁光辉 on 2024/9/19.
//  Copyright © 2024 Guanghui Liang. All rights reserved.
//

import SwiftUI

/// Render `Text` as Tag style
public struct TagViewModifier: ViewModifier {
    
    let edgeInsets: EdgeInsets
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    public init(edgeInsets: EdgeInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3),
                cornerRadius: CGFloat = 6,
                backgroundColor: Color = .accentColor) {
        self.edgeInsets = edgeInsets
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        HStack(content: {
            content
        })
        .padding(.leading, edgeInsets.leading)
        .padding(.trailing, edgeInsets.trailing)
        .padding(.top, edgeInsets.top)
        .padding(.bottom, edgeInsets.bottom)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    HStack {
        Text("SAVE 25%")
            .font(
                Font.custom("SF Pro Display", size: 20)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .modifier(TagViewModifier(cornerRadius: 8, backgroundColor: .green500))
    }
    .frame(width: 200, height: 100)
}
