//
//  Recommendation.swift
//  ExponeaSDK
//
//  Created by Ricardo Tokashiki on 20/04/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import Foundation

/// <#Description#>
public struct Recommendation: Codable {
    
    /// <#Description#>
    public let success: Bool?
    
    /// <#Description#>
    public let results: [ValueResponse]?
}
