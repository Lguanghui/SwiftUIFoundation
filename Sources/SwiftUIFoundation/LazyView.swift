//
//  LazyView.swift
//  SwiftUIFoundation 
// 
//  Created by Guanghui Liang on 2024/05/21.
//  Copyright © 2024 Guanghui Liang. All rights reserved.
//

public struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}
