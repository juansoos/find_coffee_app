import UIKit
import Flutter
import GoogleMaps
import flutter_config

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  let googleMapsApiKey = FlutterConfigPlugin.env(for: "GOOGLE_MAPS_API_KEY")!
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey(googleMapsApiKey)


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
