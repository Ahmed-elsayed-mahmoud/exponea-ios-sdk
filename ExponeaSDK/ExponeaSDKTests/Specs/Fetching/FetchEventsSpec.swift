//
//  FetchEventsSpec.swift
//  ExponeaSDKTests
//
//  Created by Ricardo Tokashiki on 18/04/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ExponeaSDK

class FetchEventsSpec: QuickSpec {

    // TODO: Finish implementation of unit tests with mock data
    override func spec() {

        let database = MockDatabase()
        let data = FetchMockData()

        let exponea = Exponea(database: database)

        describe("Fetch Event") {
            //var returnData: APIResult<EventsResult>?

            exponea.configure(plistName: "ExponeaConfig")
            expect(exponea.authorization).toNot(beNil())

            Exponea.shared.authorization = exponea.authorization
            waitUntil(timeout: 5) { done in
                exponea.fetchEvents(customerId: data.customerId, events: data.customerData) { result in
                    it("Should not return error") {
                        expect(result.error).to(beNil())
                    }
                    it("Should return success") {
                        expect(result.value?.success).to(beTrue())
                    }
                    // FIXME: API returning 0 values
//                    it("Should return any response") {
//                        expect(result.value?.data?.count).to(beGreaterThan(0))
//                    }
                    done()
                }
            }
        }
    }
}
