import UIKit
import Flutter
import MapKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        
    let appleMapsViewFactory = AppleMapsViewFactory()
    
    registrar(forPlugin: "Test").register(appleMapsViewFactory, withId: "example.com/appleMapsExample")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class AppleMapsViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return AppleMaps(frame, viewId: viewId, args: args)
    }
}


public class AppleMaps: NSObject, FlutterPlatformView, MKMapViewDelegate {
    let mapView: MKMapView = MKMapView()
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        super.init()
        mapView.delegate = self
    }
    
    public func view() -> UIView {
        return mapView
    }
}
