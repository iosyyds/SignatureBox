import SwiftUI

@main
struct SignatureBoxApp: App {
    @StateObject private var certManager = CertificateManager.shared
    @StateObject private var ipaManager = IPAManager.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(certManager)
                .environmentObject(ipaManager)
        }
    }
}
