//
//  StubEntities.swift
//  ExponeaSDKTests
//
//  Created by Ricardo Tokashiki on 17/04/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import Foundation
import CoreData

@testable import ExponeaSDK

class StubEntities {

    let container: NSPersistentContainer

    init(container: NSPersistentContainer) {
        self.container = container
    }

    func trackCustomer(projectToken: String,
                        timestamp: Double,
                        customerIdKey: String?,
                        customerIdValue: String? ) -> TrackCustomer? {
        let objct = NSEntityDescription.insertNewObject(forEntityName: "TrackCustomer",
                                                        into: container.viewContext)

        objct.setValue(projectToken, forKey: "projectToken")
        objct.setValue(timestamp, forKey: "timestamp")
        objct.setValue(customerIdKey, forKey: "customerIdKey")
        objct.setValue(customerIdValue, forKey: "customerIdValue")

        return objct as? TrackCustomer
    }

    func keyValueItem(key: String, value: Any) -> KeyValueItem? {
        let objct = NSEntityDescription.insertNewObject(forEntityName: "KeyValueItem",
                                                        into: container.viewContext)

        objct.setValue(key, forKey: "key")
        objct.setValue(value, forKey: "value")

        return objct as? KeyValueItem
    }

    func trackEvent(projectToken: String,
                     timestamp: Double,
                     eventType: String,
                     customerIdKey: String?,
                     customerIdValue: String? ) -> TrackEvent? {
        let objct = NSEntityDescription.insertNewObject(forEntityName: "TrackEvent",
                                                        into: container.viewContext)

        objct.setValue(projectToken, forKey: "projectToken")
        objct.setValue(timestamp, forKey: "timestamp")
        objct.setValue(eventType, forKey: "eventType")
        objct.setValue(customerIdKey, forKey: "customerIdKey")
        objct.setValue(customerIdValue, forKey: "customerIdValue")

        return objct as? TrackEvent
    }

    func trackEventProperties(key: String,
                               value: Any) -> KeyValueItem? {
        let objct = NSEntityDescription.insertNewObject(forEntityName: "KeyValueItem",
                                                        into: container.viewContext)

        objct.setValue(key, forKey: "key")
        objct.setValue(value, forKey: "value")

        return objct as? KeyValueItem
    }
}
