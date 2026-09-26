import Foundation

struct IPAFile: Identifiable {
    let id: UUID
    let localURL: URL
    let displayName: String
    let bundleIdentifier: String
    let version: String
    let fileSize: String
    var appIcon: Data?
}
