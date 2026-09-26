import Foundation
import SwiftUI

class IPAManager: ObservableObject {
    static let shared = IPAManager()

    @Published var ipaFiles: [IPAFile] = []

    private let fileManager = FileManager.default

    private init() {}

    func importIPAs(from result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            for url in urls {
                importIPA(from: url)
            }
        case .failure(let error):
            print("导入失败: \(error)")
        }
    }

    private func importIPA(from url: URL) {
        guard url.startAccessingSecurityScopedResource() else { return }
        defer { url.stopAccessingSecurityScopedResource() }

        let ipa = IPAFile(
            id: UUID(),
            localURL: url,
            displayName: url.deletingPathExtension().lastPathComponent,
            bundleIdentifier: "未知",
            version: "1.0",
            fileSize: "未知",
            appIcon: nil
        )

        DispatchQueue.main.async {
            self.ipaFiles.append(ipa)
        }
    }

    func delete(at offsets: IndexSet) {
        ipaFiles.remove(atOffsets: offsets)
    }
}
