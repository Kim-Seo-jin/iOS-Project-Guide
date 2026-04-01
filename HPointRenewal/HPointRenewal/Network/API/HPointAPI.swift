import Foundation
import Moya
import Alamofire

enum HPointAPI {
    case fetchCouponList(request: CouponRequest)
}

extension HPointAPI: TargetType {

    var baseURL: URL {
        guard let url = URL(string: AppEnvironment.baseURL) else {
            fatalError("BASE_URL이 올바르지 않습니다. xcconfig 및 Info.plist 설정을 확인하세요.")
        }
        return url
    }

    var path: String {
        switch self {
        case .fetchCouponList: return "/mbo/copn/selectCopnList.nhd"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchCouponList: return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchCouponList(let request):
            return .requestJSONEncodable(request)
        }
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "teOpsyGbcd": "02",
            "appVer": "3.3.1",
            "globLang": "KR"
        ]
    }
}
