//
//  App.swift
// iOS MVVM
//
//  Created by Long Do on 22/11/2024.
//

import SwiftUI
import SwiftyBeaver
import Resolver

@main
struct MVVMApp: App {
    
    let analytics: AppAnalytics = Resolver.resolve()
    
    init() {
        configureFirebase()
        configureLogging()
    }
    
    private func configureLogging() {
        SwiftyBeaver.self.addDestination(ConsoleDestination())
    }
    
    var body: some Scene {
        WindowGroup {
            UserScreenView()
                .environmentObject(analytics)
        }
    }
}
