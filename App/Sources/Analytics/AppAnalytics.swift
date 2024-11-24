//
//  app
//
//  Created by Long Do on 12/10/2022.
//

import Foundation

final public class AppAnalytics: ObservableObject {
    
    public static let DEFAULT_LOG_TYPE = AnalyticsClientType.FIREBASE | AnalyticsClientType.AMPLITUDE
    
    let clients: [AnalyticClient]
    
    init(clients: [AnalyticClient]) {
        self.clients = clients
    }
    
    public func logScreenView(_ name: String, logType: UInt8 = DEFAULT_LOG_TYPE) {
        for client in clients {
            if isValidLogEvent(logType: logType, client: client) {
                client.logScreenView(name)
            }
        }
    }
    
    public func logEvent(event: AnalyticsEvent, logType: UInt8 = DEFAULT_LOG_TYPE) {
        for client in clients {
            if isValidLogEvent(logType: logType, client: client) {
                client.logEvent(event)
            }
        }
    }
    
    public func logEvent(_ name: String, parameters: [String: Any]?, logType: UInt8 = DEFAULT_LOG_TYPE) {
        for client in clients {
            if isValidLogEvent(logType: logType, client: client) {
                client.logEvent(name, parameters: parameters)
            }
        }
    }
    
    public func setUserId(_ userId: String) {
        for client in clients {
            client.setUserId(userId)
        }
    }
    
    private func isValidLogEvent(logType: UInt8, client: AnalyticClient) -> Bool {
        return (logType & client.type) != 0
    }
    
    public class Builder {
        
        var firebaseEnable: Bool = true
        
        public init() {}

        public func build() -> AppAnalytics {
            var clients:[AnalyticClient] = []
            if (firebaseEnable) {
                clients.append(FirebaseAnalyticClient())
            }
            return AppAnalytics(clients: clients)
        }
    }
    
}
