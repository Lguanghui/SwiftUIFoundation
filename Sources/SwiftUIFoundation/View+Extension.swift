//
//  View+Extension.swift
//  SwiftUIFoundation
//
//  Created by 梁光辉 on 2025/8/31.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool,
                             transform: (Self) -> Content) -> some View {
        if condition { transform(self) } else { self }
    }
}
