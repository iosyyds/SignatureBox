import SwiftUI

struct SourcesView: View {
    let sources = ["全能签官方源", "易安免费源"]
    
    var body: some View {
        List(sources, id: \.self) { source in
            VStack(alignment: .leading) {
                Text(source)
                    .font(.headline)
                Text("可用")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationBarTitle("软件源")
    }
}
