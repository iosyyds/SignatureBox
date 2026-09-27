import SwiftUI

@main
struct SignatureBoxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("全能签")
                Text("版本 27.1.0")
                Text("适用于 iOS 17+")
            }
            .navigationTitle("首页")
        }
    }
}
