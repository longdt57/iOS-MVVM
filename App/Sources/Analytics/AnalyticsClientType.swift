//
//  File.swift
//  
//
//  Created by Long Do on 2023/01/02.
//

final public class AnalyticsClientType {
    public static let FIREBASE: UInt8      = 0b000001
    public static let AMPLITUDE: UInt8     = 0b000010
    public static var ALL: UInt8 {
        AnalyticsClientType.FIREBASE | AnalyticsClientType.AMPLITUDE
    }
}
