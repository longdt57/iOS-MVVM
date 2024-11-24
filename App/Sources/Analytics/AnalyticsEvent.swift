//
//  AnalyticsEvent.swift
//  app
//
//  Created by Long Do on 12/10/2022.
//

import Foundation

final public class AnalyticsEvent {
    
    let name: String
    let params: [String: NSObject]
    
    init(name: String, params: [String : NSObject]) {
        self.name = name
        self.params = params
    }
}
