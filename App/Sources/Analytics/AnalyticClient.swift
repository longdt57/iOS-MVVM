//
//  AnalyticClient.swift
//  app
//
//  Created by Long Do on 12/10/2022.
//

import Foundation

protocol AnalyticClient {
    
    var type: UInt8 { get }
    
    func logScreenView(_ name: String)
    func logEvent(_ event: AnalyticsEvent)
    func logEvent(_ name: String, parameters: [String: Any]?)
    func setUserId(_ userId: String)
}
