import SwiftUI

struct SourcesView: View {
    @State private var sources = [
        ("全能签官方源", "官方资源，万物皆可签"),
        ("易安免费源", "IPA应用商店")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sources, id: \.0) { source in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(source.0)
                            .font(.headline)
                        Text(source.1)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("软件源")
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
