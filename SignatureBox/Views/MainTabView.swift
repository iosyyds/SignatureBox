import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("首页")
                .tabItem { Label("首页", systemImage: "house") }
            Text("应用")
                .tabItem { Label("应用", systemImage: "app") }
            Text("软件源")
                .tabItem { Label("软件源", systemImage: "square.stack") }
            Text("工具")
                .tabItem { Label("工具", systemImage: "wrench") }
            Text("我的")
                .tabItem { Label("我的", systemImage: "person") }
        }
    }
}
