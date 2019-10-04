//
//  NetworkStubbing.swift
//  ExponeaSDKTests
//
//  Created by Panaxeo on 30/09/2019.
//  Copyright © 2019 Exponea. All rights reserved.
//


import Foundation
import Mockingjay

struct NetworkStubbing {
    static func stubNetwork(
        withStatusCode statusCode: Int,
        withDelay delay: TimeInterval = TimeInterval(0),
        withResponseData responseData: Data? = nil,
        withRequestHook requestHook: ((URLRequest) -> Void)? = nil
    ) {
        let stubResponse = HTTPURLResponse(
            url: URL(string: "mock-url")!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
        let stubData = responseData ?? "mock-response".data(using: String.Encoding.utf8, allowLossyConversion: true)!
        MockingjayProtocol.addStub(matcher: { _ in return true }, delay: delay) {request in
            requestHook?(request)
            return Response.success(stubResponse, .content(stubData))
        }
    }

    static func unstubNetwork() {
        MockingjayProtocol.removeAllStubs()
    }
}
