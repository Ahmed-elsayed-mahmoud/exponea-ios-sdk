//
//  InAppMessageSpec.swift
//  ExponeaSDKTests
//
//  Created by Panaxeo on 28/11/2019.
//  Copyright © 2019 Exponea. All rights reserved.
//
import Foundation
import Quick
import Nimble

@testable import ExponeaSDK

class InAppMessageSpec: QuickSpec {
    let payload = """
    {
        "id": "5dd86f44511946ea55132f29",
        "name": "Test serving in-app message",
        "payload": {
            "image_url":"https://i.ytimg.com/vi/t4nM1FoUqYs/maxresdefault.jpg",
            "title":"filip.vozar@exponea.com",
            "title_text_color":"#000000",
            "title_text_size":"22px",
            "body_text":"This is an example of your in-app message body text.",
            "body_text_color":"#000000",
            "body_text_size":"14px",
            "button_text":"Action",
            "button_type":"deep-link",
            "button_link":"https://someaddress.com",
            "button_text_color":"#ffffff",
            "button_background_color":"#f44cac",
            "background_color":"#ffffff",
            "close_button_color":"#ffffff"
        },
        "variant_id": 0,
        "variant_name": "Variant A",
        "trigger": {
            "exclude_pages": [],
            "include_pages": [
                { "type": "any" }
            ]
        },
        "date_filter": {
            "enabled": false,
            "from_date": 1570744800,
            "to_date": null
        }
    }
    """

    let expectedInAppMessage = InAppMessage(
        id: "5dd86f44511946ea55132f29",
        name: "Test serving in-app message",
        payload: InAppMessagePayload(
            imageUrl: "https://i.ytimg.com/vi/t4nM1FoUqYs/maxresdefault.jpg",
            title: "filip.vozar@exponea.com",
            titleTextColor: "#000000",
            titleTextSize: "22px",
            bodyText: "This is an example of your in-app message body text.",
            bodyTextColor: "#000000",
            bodyTextSize: "14px",
            buttonText: "Action",
            buttonType: "deep-link",
            buttonLink: "https://someaddress.com",
            buttonTextColor: "#ffffff",
            buttonBackgroundColor: "#f44cac",
            backgroundColor: "#ffffff",
            closeButtonColor: "#ffffff"
        ),
        variantId: 0,
        variantName: "Variant A",
        trigger: InAppMessageTrigger(includePages: [["type": "any"]]),
        dateFilter: DateFilter(
            enabled: false,
            startDate: Date(timeIntervalSince1970: 1570744800),
            endDate: nil
        )
    )

    override func spec() {
        it("should deserialize from JSON") {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .secondsSince1970
            expect(
                try? jsonDecoder.decode(InAppMessage.self, from: self.payload.data(using: .utf8)!)
            ).to(equal(self.expectedInAppMessage))
        }
    }
}
