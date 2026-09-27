import SwiftUI

struct ToolsView: View {
    var body: some View {
        List {
            Text("解压 IPA")
            Text("Dylib 管理")
            Text("修改 Bundle ID")
            Text("应用多开")
            Text("设备 UDID")
            Text("签名历史")
        }
        .navigationBarTitle("工具")
    }
}
