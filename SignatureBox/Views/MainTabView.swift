import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
            
            AppsView()
                .tabItem {
                    Image(systemName: "app.fill")
                    Text("应用")
                }
            
            SourcesView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("软件源")
                }
            
            ToolsView()
                .tabItem {
                    Image(systemName: "wrench.and.screwdriver.fill")
                    Text("工具")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("我的")
                }
        }
        .accentColor(.blue)
    }
}
