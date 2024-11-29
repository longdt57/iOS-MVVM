//
//  Encodable.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Foundation

public extension Encodable {
    public var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
