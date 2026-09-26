import SwiftUI
import UniformTypeIdentifiers

struct ProfileView: View {
    @EnvironmentObject var certManager: CertificateManager
    @State private var showingP12Importer = false
    @State private var showingMobileProvisionImporter = false
    @State private var p12Password = ""
    @State private var showingPasswordAlert = false
    @State private var pendingP12URL: URL?

    var body: some View {
        NavigationStack {
            List {
                Section("证书") {
                    if let cert = certManager.activeCertificate {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(.green)
                                Text("已导入证书")
                                    .font(.headline)
                            }
                            Text(cert.name)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        HStack {
                            Image(systemName: "exclamationmark.shield")
                                .foregroundColor(.orange)
                            Text("未导入证书")
                                .font(.headline)
                        }
                    }

                    Button {
                        showingP12Importer = true
                    } label: {
                        Label("导入 P12 证书", systemImage: "doc.badge.plus")
                    }

                    Button {
                        showingMobileProvisionImporter = true
                    } label: {
                        Label("导入描述文件", systemImage: "doc.badge.plus")
                    }

                    if certManager.activeCertificate != nil {
                        Button("移除证书", role: .destructive) {
                            certManager.removeActiveCertificate()
                        }
                    }
                }

                Section("设备信息") {
                    LabeledContent("设备 UDID", value: "未获取")
                    LabeledContent("系统版本", value: UIDevice.current.systemVersion)
                }

                Section("关于") {
                    LabeledContent("版本", value: "27.1.0")
                    LabeledContent("大小", value: "6.12 MB")
                    LabeledContent("兼容", value: "iOS 12+")
                }
            }
            .navigationTitle("我的")
            .fileImporter(
                isPresented: $showingP12Importer,
                allowedContentTypes: [UTType(filenameExtension: "p12")!],
                allowsMultipleSelection: false
            ) { result in
                if case .success(let urls) = result, let url = urls.first {
                    pendingP12URL = url
                    showingPasswordAlert = true
                }
            }
            .fileImporter(
                isPresented: $showingMobileProvisionImporter,
                allowedContentTypes: [UTType(filenameExtension: "mobileprovision")!],
                allowsMultipleSelection: false
            ) { result in
                if case .success(let urls) = result, let url = urls.first {
                    certManager.importMobileProvision(from: url)
                }
            }
            .alert("输入 P12 密码", isPresented: $showingPasswordAlert) {
                SecureField("密码", text: $p12Password)
                Button("取消", role: .cancel) {}
                Button("导入") {
                    if let url = pendingP12URL {
                        certManager.importP12(from: url, password: p12Password)
                        p12Password = ""
                    }
                }
            }
        }
    }
}
