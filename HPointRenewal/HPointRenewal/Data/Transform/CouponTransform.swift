import Foundation

// MARK: - Domain DTO → Network Request
extension CouponRequestDTO {
    func toRequest() -> CouponRequest {
        CouponRequest(
            mcustNo: mcustNo,
            copnGbcd: copnGbcd,
            prfrYn: prfrYn,
            ptcoId: ptcoId
        )
    }
}

// MARK: - Network DTO → Domain Entity
extension CouponDTO {
    func toDomain() -> CouponEntity {
        CouponEntity(
            id: "\(ofrId ?? "")-\(campId ?? "")",
            campId: campId ?? "",
            ofrId: ofrId ?? "",
            name: name ?? "",
            titleImage: titleImage,
            couponType: CouponEntity.CouponType(rawValue: copnTypeGbcd ?? "") ?? .unknown
        )
    }
}
