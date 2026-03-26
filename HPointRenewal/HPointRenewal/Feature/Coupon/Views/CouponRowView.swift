import SwiftUI
import Kingfisher

struct CouponRowView: View {

    let coupon: CouponEntity
    let onDownload: (CouponEntity) -> Void

    var body: some View {
        HStack(spacing: 12) {
            couponImage
            couponInfo
            Spacer()
            downloadButton
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private var couponImage: some View {
        if let urlString = coupon.titleImage, let url = URL(string: urlString) {
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } else {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "ticket")
                        .foregroundStyle(.secondary)
                }
        }
    }

    private var couponInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(coupon.name)
                .font(.body)
                .lineLimit(2)
            Text(coupon.couponType == .pluspoint ? "포인트 적립" : "할인 쿠폰")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var downloadButton: some View {
        Button {
            onDownload(coupon)
        } label: {
            Image(systemName: "arrow.down.circle")
                .font(.title2)
                .foregroundStyle(.blue)
        }
        .buttonStyle(.plain)
    }
}
