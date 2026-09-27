import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("首页", systemImage: "house.fill")
                }
            
            AppsView()
                .tabItem {
                    Label("应用", systemImage: "app.fill")
                }
            
            SourcesView()
                .tabItem {
                    Label("软件源", systemImage: "square.stack.3d.up.fill")
                }
            
            ToolsView()
                .tabItem {
                    Label("工具", systemImage: "wrench.and.screwdriver.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("我的", systemImage: "person.crop.circle.fill")
                }
        }
        .tint(.blue)
    }
}
