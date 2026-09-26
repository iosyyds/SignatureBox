import SwiftUI
import UniformTypeIdentifiers

struct AppsView: View {
    @EnvironmentObject var ipaManager: IPAManager
    @EnvironmentObject var certManager: CertificateManager
    @State private var showingImporter = false

    var body: some View {
        NavigationStack {
            List {
                if ipaManager.ipaFiles.isEmpty {
                    ContentUnavailableView(
                        "暂无 IPA 文件",
                        systemImage: "app.dashed",
                        description: Text("点击右上角导入 IPA 文件")
                    )
                } else {
                    ForEach(ipaManager.ipaFiles) { ipa in
                        IPARowView(ipa: ipa)
                    }
                    .onDelete(perform: ipaManager.delete)
                }
            }
            .navigationTitle("应用")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingImporter = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .fileImporter(
                isPresented: $showingImporter,
                allowedContentTypes: [UTType(filenameExtension: "ipa")!],
                allowsMultipleSelection: true
            ) { result in
                ipaManager.importIPAs(from: result)
            }
        }
    }
}

struct IPARowView: View {
    let ipa: IPAFile
    @EnvironmentObject var certManager: CertificateManager
    @State private var isSigning = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(ipa.displayName)
                .font(.headline)
            Text("Bundle: \(ipa.bundleIdentifier)")
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(ipa.fileSize) · \(ipa.version)")
                .font(.caption)
                .foregroundColor(.secondary)

            HStack {
                Button("签名安装") {
                    signIPA()
                }
                .buttonStyle(.borderedProminent)
                .disabled(certManager.activeCertificate == nil)

                Button("修改") {}
                    .buttonStyle(.bordered)
            }
        }
        .padding(.vertical, 4)
    }

    private func signIPA() {
        isSigning = true
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isSigning = false
        }
    }
}
