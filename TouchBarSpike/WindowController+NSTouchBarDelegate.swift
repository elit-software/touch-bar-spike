import Cocoa

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
        case NSTouchBarItemIdentifier.button:
            let label = "Click me!"
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = label
            custom.view = NSButton(title: label, target: self, action: #selector(clickMe))
            return custom
        default: return nil
        }
    }
}
