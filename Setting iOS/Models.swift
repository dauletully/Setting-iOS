import UIKit

public struct SettingOptions {
    var title: String
    var iconImage: UIImage
}

extension SettingOptions {
    static var options: [[SettingOptions]] = [
        [
            SettingOptions(title: "Airplane mode", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Wi-Fi", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Bluetooth", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Cellular", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Personal Hotstop", iconImage: UIImage(systemName: "personalhotspot")!),
            SettingOptions(title: "VPN", iconImage: UIImage(systemName: "wifi")!)
        ],
        [
            SettingOptions(title: "Notifications", iconImage: UIImage(systemName: "bell.badge.fill")!),
            SettingOptions(title: "Sounds & Haptics", iconImage: UIImage(systemName: "speaker.wave.3.fill")!),
            SettingOptions(title: "Focus", iconImage: UIImage(systemName: "moon.fill")!),
            SettingOptions(title: "Screen Time", iconImage: UIImage(systemName: "switch.2")!),
        ],
        [
            SettingOptions(title: "General", iconImage: UIImage(systemName: "gear")!),
            SettingOptions(title: "Control Center", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Display & Brightness", iconImage: UIImage(systemName: "textformat.size")!),
            SettingOptions(title: "Home Screen", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Accessibility", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Emergency SIS", iconImage: UIImage(systemName: "sos")!),
            SettingOptions(title: "Siri & Search", iconImage: UIImage(systemName: "wifi")!),
            SettingOptions(title: "Face ID & Passcode", iconImage: UIImage(systemName: "faceid")!),
        ]
    ]
}
