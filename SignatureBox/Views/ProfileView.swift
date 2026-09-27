import SwiftUI
import UIKit

struct ProfileView: View {
    var body: some View {
        List {
            Section(header: Text("证书")) {
                Text("未导入证书")
                Text("导入 P12 证书")
                Text("导入描述文件")
            }
            Section(header: Text("关于")) {
                HStack {
                    Text("版本")
                    Spacer()
                    Text("27.1.0")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationBarTitle("我的")
    }
}
