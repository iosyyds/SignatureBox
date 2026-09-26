import SwiftUI

struct HomeView: View {
    @EnvironmentObject var certManager: CertificateManager
    @EnvironmentObject var ipaManager: IPAManager

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.2, green: 0.5, blue: 1.0), Color(red: 0.1, green: 0.3, blue: 0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            Image(systemName: "signature")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                                .padding()
                                .background(Circle().fill(.white.opacity(0.2)))

                            Text("全能签")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("当前版本：27.1.0  大小：6.12MB")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))

                            Text("适用于 iOS 12 以上设备")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding(.top, 40)

                        VStack(spacing: 12) {
                            if let cert = certManager.activeCertificate {
                                StatusRow(icon: "checkmark.shield.fill", color: .green, title: "已导入证书", subtitle: cert.name)
                            } else {
                                StatusRow(icon: "exclamationmark.shield.fill", color: .orange, title: "未导入证书", subtitle: "请到「我的」页面导入证书")
                            }

                            StatusRow(icon: "app.badge.checkmark", color: .blue, title: "已导入应用", subtitle: "\(ipaManager.ipaFiles.count) 个 IPA 文件")
                        }
                        .padding()
                        .background(.white.opacity(0.15))
                        .cornerRadius(16)
                        .padding(.horizontal)

                        VStack(spacing: 12) {
                            FeatureButton(title: "一键签名安装", icon: "paperplane.fill", color: .blue) {}
                            FeatureButton(title: "导入 IPA 文件", icon: "square.and.arrow.down.fill", color: .green) {}
                            FeatureButton(title: "注入动态库", icon: "puzzlepiece.fill", color: .orange) {}
                            FeatureButton(title: "修改 Bundle ID", icon: "pencil.circle.fill", color: .purple) {}
                        }
                        .padding(.horizontal)

                        Text("签名功能完全免费，可脱离联网使用")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .padding(.bottom, 30)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct StatusRow: View {
    let icon: String
    let color: Color
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }

            Spacer()
        }
    }
}

struct FeatureButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .foregroundColor(.white)
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(12)
        }
    }
}
