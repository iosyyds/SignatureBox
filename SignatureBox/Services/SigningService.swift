import Foundation

class SigningService {
    static let shared = SigningService()

    private init() {}

    func sign(
        ipaURL: URL,
        certificate: Certificate,
        onProgress: @escaping (Double) -> Void
    ) async throws -> URL {
        onProgress(0.1)
        try await Task.sleep(nanoseconds: 500_000_000)
        onProgress(0.5)
        try await Task.sleep(nanoseconds: 500_000_000)
        onProgress(1.0)
        return ipaURL
    }
}
