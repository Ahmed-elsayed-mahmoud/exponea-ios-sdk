## 🔍 Enabling universal links
The setup process is described in detail in the offical Apple documentation page [Enabling Universal Links](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content/enabling_universal_links).

- Ensure you have added the Associated Domains Entitlement to your app in the Capabilities/Associated Domains, e.g.: `applinks:yourdomain.com` and `webcredentials:yourdomain.com`.
- Ensure you have set up the Apple App Site Association file on your website configured properly according to the [Apple’s documentation](https://developer.apple.com/documentation/security/password_autofill/setting_up_an_app_s_associated_domains#3001215).

Once the setup is completed, opening universal link should open your app.

> **NOTE:** Easiest way to test the integration is to send yourself an email containing the Universal link and open it in your email client in web browser. Universal links work correctly when a user taps `<a href="...">` that will drive the user to another domain. Pasting the url into Safari won't work, neither does following the link on the same domain, or opening the url with Javascript.

## 🔍 Tracking universal links
Update your app’s App Delegate to respond to the universal link.

When iOS opens your app as the result of a universal link, your app receives an `NSUserActivity` object with an `activityType` value of `NSUserActivityTypeBrowsingWeb`. The activity object’s `webpageURL` property contains the URL that needs to be passed on to the Exponea SDK’s `.trackCampaignClick()` method.  

Universal Link parameters are automatically tracked in `session_start` events when new session is started. If your app starts a new session, campaign parameters (`utm_source`, `utm_campaign`, `utm_content`, `utm_medium`, `utm_term` and `xnpe_cmp`) are sent within the session parameters to enable you to attribute the new session to Universal Link click.

> **NOTE:** If an existing session is resumed by clicking on an Universal Link, the resumed session is **NOT** attributed to the Universal Link click, the Universal Link click parameters are not tracked in the `session_start` event. Session behaviour is determined by the setup of the 'automaticSessionTracking' and 'sessionTimeout' parameters described in [ExponeaConfiguration](./CONFIG.md). Please consider this for manual session handling or when you test the Universal Link tracking during the development.

#### 💻 Example

```swift
func application(_ application:UIApplication,
                 continue userActivity: NSUserActivity,
                 restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
        let incomingURL = userActivity.webpageURL
        else { return false }

    Exponea.shared.trackCampaignClick(url: incomingURL, timestamp: nil)
    return true
}
```

> **NOTE:** Exponea SDK might not be configured when `.trackCampaingClick()` is called. In this case, the event will be sent to Exponea servers **after** SDK is configured with `Exponea.shared.configure()`. 