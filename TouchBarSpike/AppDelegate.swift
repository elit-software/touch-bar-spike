import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        allowTouchBarToBeCustomized()
    }

    func allowTouchBarToBeCustomized() {
        if #available(OSX 10.12.1, *) {
            if NSClassFromString("NSTouchBar") != nil {
                NSApplication.shared().isAutomaticCustomizeTouchBarMenuItemEnabled = true
            }
        }
    }
}

