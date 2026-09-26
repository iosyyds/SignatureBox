import Foundation
import Security

class CertificateManager: ObservableObject {
    static let shared = CertificateManager()
    @Published var activeCertificate: Certificate?
}
