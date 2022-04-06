import Flutter
import UIKit
import ContactsUI

public class SwiftOffersSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "offers_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftOffersSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getAContact" {
        getAContact(withResult: result)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }

    var contactPickerDelegate: ContactPickerDelegate?
    private func getAContact(withResult result: @escaping FlutterResult) {
        let contactPicker = CNContactPickerViewController()
        contactPickerDelegate = ContactPickerDelegate(onSelectContact: { contact in
            result(contact.givenName + contact.familyName)
            self.contactPickerDelegate = nil
            self
        },
        onCancel: {
            result(nil)
            self.contactPickerDelegate = nil
        })
        contactPicker.delegate = contactPickerDelegate
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        let rootViewController = keyWindow?.rootViewController
        DispatchQueue.main.async {
            rootViewController?.present(contactPicker, animated: true)
        }
    }
}