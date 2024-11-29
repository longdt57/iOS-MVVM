//
//  IntExtension.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Foundation

public extension Optional where Wrapped == Int {
    
    public func orDefault(value: Int) -> Int {
        self ?? value
    }

}

public extension Int {
    
    public func toString() -> String {
        String(self)
    }
}
