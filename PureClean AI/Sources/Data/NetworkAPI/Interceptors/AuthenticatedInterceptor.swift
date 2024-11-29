//
//  AuthenticatedInterceptor.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Alamofire
import Foundation
import Resolver

final class AuthenticatedInterceptor: RequestInterceptor {

    @Injected var keychain: KeychainProtocol

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        if let accessToken = try? keychain.get(.signInInfo)?.getAccessToken() {
            request.headers.add(HTTPHeader.authorization(bearerToken: accessToken))
        } else if let codeToken = try? UserDefaults.standard.string(forKey: UserDefaultKeys.codeToken) {
            request.headers.add(HTTPHeader.authorization(bearerToken: codeToken))
        }

        completion(.success(request))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // print("\(#function) : request : \(request), retryCount : \(request.retryCount)")
        if let status = request.response?.statusCode, status == HttpUrlConnection.HTTP_UNAUTHORIZED {
            NotificationCenter.default.post(name: .unauthorized, object: nil)
        }
        completion(.doNotRetry)
    }
}

// MARK: - NSNotification.Name

extension NSNotification.Name {

    static let unauthorized = NSNotification.Name("unauthorized")
}
