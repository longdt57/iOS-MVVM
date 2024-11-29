//
//  HTTPHeader.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Alamofire

extension HTTPHeader {
    
    static var jsonContentType: HTTPHeader {
        HTTPHeader.contentType("application/json")
    }
}
