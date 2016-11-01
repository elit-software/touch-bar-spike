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
            let label = buttonLabel()
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = label
            custom.view = NSButton(title: label, target: self, action: #selector(touchBarButtonClicked))
            return custom
        default: return nil
        }
    }

    func buttonLabel() -> String {
        switch touchBarClicks {
        case 0:
            return "You still didn't clicked me 😭"
        case 1:
            return "You clicked me one time 😊"
        default:
            return "You clicked me \(touchBarClicks) times 😁"
        }
    }
}
