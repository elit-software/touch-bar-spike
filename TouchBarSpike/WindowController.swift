import Cocoa

class WindowController: NSWindowController {
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.text]
        touchBar.customizationAllowedItemIdentifiers = [.text]
        return touchBar
    }
}
