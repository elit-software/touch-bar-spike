import Cocoa

class WindowController: NSWindowController {

    var touchBarClicks = 0

    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.text, .button]
        touchBar.customizationAllowedItemIdentifiers = [.text, .button]
        return touchBar
    }

    func touchBarButtonClicked() {
        touchBarClicks += 1
        invalidateTouchBar()
    }

    func invalidateTouchBar() {
        if #available(OSX 10.12.1, *) {
            touchBar = nil
        }
    }
}
