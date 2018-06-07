//
//  Repository.swift
//  ExponeaSDK
//
//  Created by Ricardo Tokashiki on 04/04/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import Foundation

/// Protocol containing the possibles tracking methods.
protocol TrackingRepository {
    /// Tracks the data of the data type property for a customer.
    ///
    /// - Parameters:
    ///     - data: Object containing the data to be used to track a customer data.
    ///     - customerIds: Customer identification.
    ///     - completion: Object containing the request result.
    func trackCustomer(with data: [DataType],
                       for customerIds: [String: String],
                       completion: @escaping ((EmptyResult) -> Void))

    /// Tracks new events for a customer.
    ///
    /// - Parameters:
    ///     - data: Object containing the data to be used to track a customer data.
    ///     - customerIds: Customer identification.
    ///     - completion: Object containing the request result.
    func trackEvent(with data: [DataType],
                    for customerIds: [String: String],
                    completion: @escaping ((EmptyResult) -> Void))
}

protocol FetchRepository {
    /// Fetch a recommendation by its ID for particular customer.
    ///
    /// - Parameters:
    ///   - customerIds: Identification of a customer.
    ///   - recommendation: Recommendations for the customer.
    ///   - completion: Object containing the request result.
    func fetchRecommendation(recommendation: RecommendationRequest, for customerIds: [String: String],
                             completion: @escaping (Result<RecommendationResponse>) -> Void)

    /// Fetch multiple customer attributes at once
    ///
    /// - Parameters:
    ///   - customerIds: Identification of a customer.
    ///   - attributes: List of attributes you want to retrieve.
    func fetchAttributes(attributes: [AttributesDescription], for customerIds: [String: String],
                         completion: @escaping (Result<AttributesListDescription>) -> Void)

    /// Fetch customer events by its type.
    ///
    /// - Parameters:
    ///   - customerIds: Identification of a customer.
    ///   - events: List of event types to be retrieve.
    ///   - completion: Object containing the request result.
    func fetchEvents(events: EventsRequest, for customerIds: [String: String],
                     completion: @escaping (Result<EventsResponse>) -> Void)
}

protocol RepositoryType: class, TrackingRepository, FetchRepository {
    var configuration: Configuration { get set }
}
