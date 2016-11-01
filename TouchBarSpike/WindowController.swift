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

extension WindowController: NSTouchBarDelegate {
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItemIdentifier.text:
            let label = "Hello Touch Bar!"
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = label
            custom.view = NSTextField.init(labelWithString: label)
            return custom
        default: return nil
        }
    }
}

struct Constants {
    static let id = "com.elit.TouchBarSpike"
}

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("\(Constants.id).touchBar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let text = NSTouchBarItemIdentifier("\(Constants.id).text")
}
