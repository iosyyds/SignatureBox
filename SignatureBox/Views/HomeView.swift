import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "signature")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.white.opacity(0.2)))
                    
                    Text("全能签")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("当前版本：27.1.0")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    VStack(spacing: 10) {
                        HomeButton(title: "一键签名安装", icon: "paperplane", color: .blue)
                        HomeButton(title: "导入 IPA 文件", icon: "square.and.arrow.down", color: .green)
                        HomeButton(title: "注入动态库", icon: "puzzlepiece", color: .orange)
                        HomeButton(title: "修改 Bundle ID", icon: "pencil", color: .purple)
                    }
                    .padding(.horizontal)
                    
                    Text("签名功能完全免费")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding(.top, 50)
            }
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
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
        }
        .foregroundColor(.white)
        .padding()
        .background(color)
        .cornerRadius(12)
    }
}
