import Foundation
import Security

struct Certificate: Identifiable {
    let id: UUID
    let name: String
    let expiryDate: Date
    let type: CertType
    let p12Data: Data
    let p12Password: String
    let mobileProvisionData: Data?

    enum CertType: String {
        case development = "开发证书"
        case distribution = "发布证书"
        case enterprise = "企业证书"
        case unknown = "未知"

        var description: String { self.rawValue }
    }

    var typeDescription: String { type.description }
    var isExpired: Bool { Date() > expiryDate }
}
