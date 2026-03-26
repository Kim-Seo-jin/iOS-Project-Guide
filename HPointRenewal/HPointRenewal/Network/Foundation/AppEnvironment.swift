import Foundation

enum AppEnvironment {
    static var baseURL: String {
        Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
