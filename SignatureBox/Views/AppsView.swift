import SwiftUI

struct AppsView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "app.badge")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("暂无 IPA 文件")
                .font(.headline)
                .padding(.top, 10)
            Text("点击右上角导入")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationBarTitle("应用")
    }
}
