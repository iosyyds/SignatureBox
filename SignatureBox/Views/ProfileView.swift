import SwiftUI
import UIKit

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("证书") {
                    HStack {
                        Image(systemName: "exclamationmark.shield")
                            .foregroundColor(.orange)
                        Text("未导入证书")
                            .font(.headline)
                    }
                    
                    Button(action: {}) {
                        Label("导入 P12 证书", systemImage: "doc.badge.plus")
                    }
                    
                    Button(action: {}) {
                        Label("导入描述文件", systemImage: "doc.badge.plus")
                    }
                }
                
                Section("设备信息") {
                    LabeledContent("系统版本", value: UIDevice.current.systemVersion)
                }
                
                Section("关于") {
                    LabeledContent("版本", value: "27.1.0")
                    LabeledContent("大小", value: "6.12 MB")
                    LabeledContent("兼容", value: "iOS 12+")
                }
            }
            .navigationTitle("我的")
        }
    }
}
