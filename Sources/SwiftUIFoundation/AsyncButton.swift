//
//  AsyncButton.swift
//  SwiftUIFoundation
// 
//  Created by 梁光辉 on 2024/8/25.
//  Copyright © 2024 Guanghui Liang. All rights reserved.
//

import SwiftUI
import FoundationX

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AsyncButton<Label>: View where Label: View {

    public typealias Action = @Sendable @MainActor () async throws -> Void

    private let action: Action
    private let label: Label

    public init(
        action: @escaping Action,
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = label()
    }

    public var body: some View {
        Button {
            Task<Void, Never> {
                do {
                    try await self.action()
                } catch let error as NSError {
                    XLogger.log("[AsyncButton] unexpect error when running action: \(error)")
                }
            }
        } label: {
            self.label
        }
    }

}

#Preview {
    if #available(macOS 12.0, *) {
        AsyncButton {
            
        } label: {
            Text("Hello World!")
        }
        .frame(width: 200, height: 50)
    } else {
        // Fallback on earlier versions
        EmptyView()
    }

}
