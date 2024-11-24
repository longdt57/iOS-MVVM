//
//  Environment.swift
//  app
//
//  Created by Long Do.
//

import Foundation

private enum BuildType: String {
    case debug = "Debug"
    case release = "Release"
}

class BuildConfig {
    static let shared = BuildConfig()
    
    private static let buildType: BuildType = BuildType(rawValue: Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String)!
    
    static var debug: Bool {
        switch BuildConfig.buildType {
        case .debug:
            return true
        case .release:
            return false
        }
    }
    
    static var verionName: String {
        (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String).orEmpty()
    }
    
    static var versionCode: String {
        (Bundle.main.infoDictionary?["CFBundleVersion"] as? String).orEmpty()
    }

    static var applicationId: String {
        Bundle.main.bundleIdentifier.orEmpty()
    }
}
