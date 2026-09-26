import Foundation
import Security
import UniformTypeIdentifiers

class CertificateManager: ObservableObject {
    static let shared = CertificateManager()

    @Published var activeCertificate: Certificate?
    @Published var certificates: [Certificate] = []

    private let fileManager = FileManager.default
    private var certDir: URL {
        let docs = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dir = docs.appendingPathComponent("Certificates", isDirectory: true)
        try? fileManager.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir
    }

    private init() {
        loadSavedCertificates()
    }

    func importP12(from url: URL, password: String) {
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            print("读取 P12 失败: \(error)")
            return
        }

        let options = [
            kSecImportExportPassphrase as String: password
        ] as CFDictionary

        var items: CFArray?
        let status = SecPKCS12Import(data, options, &items)

        guard status == errSecSuccess, let itemsArray = items as? [[String: Any]],
              let firstItem = itemsArray.first else {
            print("P12 解析失败，状态码: \(status)")
            return
        }

        guard let secItem = firstItem[kSecImportItemIdentity as String] as! SecCertificate? else {
            print("无法提取证书")
            return
        }

        let commonName = SecCertificateCopySubjectSummary(secItem) as String? ?? "未命名证书"

        let cert = Certificate(
            id: UUID(),
            name: commonName,
            expiryDate: Date(),
            type: .unknown,
            p12Data: data,
            p12Password: password,
            mobileProvisionData: nil
        )

        DispatchQueue.main.async {
            self.certificates.append(cert)
            self.activeCertificate = cert
        }
    }

    func importMobileProvision(from url: URL) {
        do {
            let data = try Data(contentsOf: url)
            if var cert = activeCertificate {
                cert = Certificate(
                    id: cert.id,
                    name: cert.name,
                    expiryDate: cert.expiryDate,
                    type: cert.type,
                    p12Data: cert.p12Data,
                    p12Password: cert.p12Password,
                    mobileProvisionData: data
                )
                DispatchQueue.main.async {
                    self.activeCertificate = cert
                }
            }
        } catch {
            print("导入 mobileprovision 失败: \(error)")
        }
    }

    func removeActiveCertificate() {
        activeCertificate = nil
    }

    private func loadSavedCertificates() {}
}
