import SwiftUI

struct AppsView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "app.dashed")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("暂无 IPA 文件")
                            .font(.headline)
                        Text("点击右上角导入 IPA 文件")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical, 40)
            }
            .navigationTitle("应用")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
