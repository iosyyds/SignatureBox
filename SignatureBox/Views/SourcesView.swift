import SwiftUI

struct Source: Identifiable {
    let id: UUID
    let name: String
    let url: String
    let description: String
}

struct SourcesView: View {
    @State private var sources: [Source] = [
        Source(id: UUID(), name: "全能签官方源", url: "https://qnq.nuosike.cn/appstore", description: "官方资源，万物皆可签"),
        Source(id: UUID(), name: "易安免费源", url: "https://www.iosr.cn", description: "IPA应用商店")
    ]
    @State private var showingAddAlert = false
    @State private var newSourceURL = ""

    var body: some View {
        NavigationStack {
            List {
                Section("已添加的源") {
                    ForEach(sources) { source in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(source.name)
                                .font(.headline)
                            Text(source.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: deleteSource)
                }
            }
            .navigationTitle("软件源")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("添加第三方软件源", isPresented: $showingAddAlert) {
                TextField("输入源地址", text: $newSourceURL)
                Button("取消", role: .cancel) {}
                Button("添加") { addSource() }
            } message: {
                Text("请输入软件源的 URL 地址")
            }
        }
    }

    private func addSource() {
        guard !newSourceURL.isEmpty else { return }
        sources.append(Source(id: UUID(), name: "新源", url: newSourceURL, description: newSourceURL))
        newSourceURL = ""
    }

    private func deleteSource(at offsets: IndexSet) {
        sources.remove(atOffsets: offsets)
    }
}
