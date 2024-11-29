//
//  NetworkAPI.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Alamofire

final class NetworkAPI: NetworkAPIProtocol {

    private let decoder: JSONDecoder
    let session: Session

    init(decoder: JSONDecoder = JSONDecoder(), authenticatedInterceptor: AuthenticatedInterceptor) {
        self.decoder = decoder
        let composite = Interceptor(
            interceptors: [
                authenticatedInterceptor
            ]
        )
        self.session = Session(interceptor: composite)
    }

    func performRequest<T: Decodable>(
        _ configuration: RequestConfiguration,
        for type: T.Type
    ) async throws -> T {
        try await request(
            session: Session(),
            configuration: configuration,
            decoder: decoder
        )
    }
}
