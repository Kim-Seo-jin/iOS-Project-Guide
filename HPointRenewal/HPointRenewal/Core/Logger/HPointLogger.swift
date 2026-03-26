import OSLog

// MARK: - Log Category

/// 로그 카테고리. Console.app 필터링 및 기능 단위 구분에 사용
enum HPointLogCategory: String {
    case network = "Network"
    case ui      = "UI"
    case data    = "Data"
}

// MARK: - Log Level

enum HPointLogLevel {
    case debug
    case info
    case notice
    case error
    case fault
}

// MARK: - Log Privacy

enum HPointLogPrivacy {
    /// Console.app 에서 실제 값 그대로 표시
    case `public`
    /// 민감 데이터. Console.app 에서 `<private>` 마스킹.
    /// Xcode 직접 실행 시에만 실제 값 표시
    case `private`
}

// MARK: - Internal

private let subsystem = Bundle.main.bundleIdentifier ?? "com.hpoint.guide"

private func makeLogger(for category: HPointLogCategory) -> Logger {
    Logger(subsystem: subsystem, category: category.rawValue)
}

/// HPoint 공통 로그 헬퍼
func hpLog(
    _ message: String,
    category: HPointLogCategory,
    level: HPointLogLevel = .notice,
    privacy: HPointLogPrivacy = .public
) {
    #if DEBUG
    let logger = makeLogger(for: category)

    switch privacy {
    case .public:
        switch level {
        case .debug:  logger.debug("\(message, privacy: .public)")
        case .info:   logger.info("\(message, privacy: .public)")
        case .notice: logger.notice("\(message, privacy: .public)")
        case .error:  logger.error("\(message, privacy: .public)")
        case .fault:  logger.fault("\(message, privacy: .public)")
        }
    case .private:
        switch level {
        case .debug:  logger.debug("\(message, privacy: .private)")
        case .info:   logger.info("\(message, privacy: .private)")
        case .notice: logger.notice("\(message, privacy: .private)")
        case .error:  logger.error("\(message, privacy: .private)")
        case .fault:  logger.fault("\(message, privacy: .private)")
        }
    }
    #endif
}
