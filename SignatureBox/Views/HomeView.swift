import SwiftUI

struct HomeView: View {
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
                            HStack {
                                Image(systemName: "exclamationmark.shield")
                                    .foregroundColor(.orange)
                                    .font(.title2)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("未导入证书")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text("请到「我的」页面导入证书")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                Spacer()
                            }
                            
                            HStack {
                                Image(systemName: "app.badge")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("已导入应用")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text("0 个 IPA 文件")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                Spacer()
                            }
                        }
                        .padding()
                        .background(.white.opacity(0.15))
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            HomeButton(title: "一键签名安装", icon: "paperplane.fill", color: .blue)
                            HomeButton(title: "导入 IPA 文件", icon: "square.and.arrow.down.fill", color: .green)
                            HomeButton(title: "注入动态库", icon: "puzzlepiece.fill", color: .orange)
                            HomeButton(title: "修改 Bundle ID", icon: "pencil.circle.fill", color: .purple)
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

struct HomeButton: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
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
