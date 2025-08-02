//
//  Router.swift
//  SwiftUIFoundation
//
//  Created by Guanghui Liang on 2025/8/2.
//

import SwiftUI
import Observation

@Observable
final public class Router<Dest: Destination> {
    public var navPath = NavigationPath()
    
    public init() {
        
    }
}

public extension Router {
    func navigate(to destination: Dest) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
