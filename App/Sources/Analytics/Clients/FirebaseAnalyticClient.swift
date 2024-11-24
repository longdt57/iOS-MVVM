//
//  FirebaseClient.swift
//  app
//
//  Created by Long Do on 12/10/2022.
//

import FirebaseAnalytics

final class FirebaseAnalyticClient: AnalyticClient {
    
    var type: UInt8 = AnalyticsClientType.FIREBASE
    
    func logScreenView(_ name: String) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
            AnalyticsParameterScreenName: name,
            AnalyticsParameterScreenClass: name
        ])
    }
    
    func logEvent(_ name: String, parameters: [String : Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
    
    func logEvent(_ event: AnalyticsEvent) {
        Analytics.logEvent(event.name, parameters: event.params)
    }
    
    func setUserId(_ userId: String) {
        Analytics.setUserID(userId)
    }
    
}
