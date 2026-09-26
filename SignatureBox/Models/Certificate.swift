import Foundation
import Security

struct Certificate {
    let name: String
    let expiryDate: Date
    let p12Data: Data
    let p12Password: String
}
