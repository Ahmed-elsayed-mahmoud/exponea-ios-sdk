//
//  ExportedEventType.swift
//  ExponeaSDK
//
//  Created by Ricardo Tokashiki on 20/04/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import Foundation

public struct ExportedEventType: Codable {
    let type: String?
    let timestamp: Double?
    let properties: [String: String]?
    let errors: [String: String]?
}
