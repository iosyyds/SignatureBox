import Foundation
import SwiftUI

class IPAManager: ObservableObject {
    static let shared = IPAManager()
    @Published var ipaFiles: [IPAFile] = []
}
