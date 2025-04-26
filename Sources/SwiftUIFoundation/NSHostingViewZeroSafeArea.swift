//
//  NSHostingViewZeroSafeArea.swift
//  SwiftUIFoundation 
// 
//  Created by Guanghui Liang on 2024/06/05.
//  Copyright © 2024 Guanghui Liang. All rights reserved.
//

import SwiftUI
#if canImport(AppKit)
import AppKit

@available(macOS 12.0, *)
public class NSHostingViewZeroSafeArea<T : View>: NSHostingView<T> {
    public required init(rootView: T) {
        super.init(rootView: rootView)

        addLayoutGuide(layoutGuide)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
    }

    private lazy var layoutGuide = NSLayoutGuide()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var safeAreaRect: NSRect {
        return frame
    }

    public override var safeAreaInsets: NSEdgeInsets {
        return NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public override var safeAreaLayoutGuide: NSLayoutGuide {
        return layoutGuide
    }

    public override var additionalSafeAreaInsets: NSEdgeInsets {
        get {
            return NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        set {
            
        }
    }
}
#endif
