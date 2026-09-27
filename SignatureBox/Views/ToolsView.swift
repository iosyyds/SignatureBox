import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("签名工具") {
                    ToolRow(icon: "doc.zipper", color: .blue, title: "解压 IPA", subtitle: "查看 IPA 内部结构")
                    ToolRow(icon: "puzzlepiece", color: .green, title: "Dylib 管理", subtitle: "注入或移除动态库")
                    ToolRow(icon: "pencil.circle", color: .orange, title: "修改 Bundle ID", subtitle: "自定义应用包名")
                    ToolRow(icon: "square.on.square", color: .purple, title: "应用多开", subtitle: "创建多开副本")
                }
                
                Section("系统工具") {
                    ToolRow(icon: "iphone", color: .blue, title: "设备 UDID", subtitle: "查看本机设备标识")
                    ToolRow(icon: "doc.text", color: .green, title: "描述文件管理", subtitle: "查看已安装的描述文件")
                    ToolRow(icon: "clock.arrow.circlepath", color: .orange, title: "签名历史", subtitle: "查看历史签名记录")
                }
                
                Section("其他") {
                    ToolRow(icon: "gearshape", color: .gray, title: "签名配置", subtitle: "预设签名选项")
                    ToolRow(icon: "trash", color: .red, title: "清理缓存", subtitle: "删除临时文件")
                }
            }
            .navigationTitle("工具")
        }
    }
}

struct ToolRow: View {
    let icon: String
    let color: Color
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.tertiaryLabel)
        }
    }
}
