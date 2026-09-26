import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    @Published var certificates: [Certificate] = []
    @Published var ipaFiles: [IPAFile] = []
}
