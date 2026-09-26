import Foundation
import UIKit

class InstallService {
    static let shared = InstallService()

    private init() {}

    func install(ipaURL: URL) {
        print("准备安装: \(ipaURL.lastPathComponent)")
    }
}
