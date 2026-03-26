import SwiftUI
import Kingfisher

struct CouponDetailView: View {

    let coupon: CouponEntity
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                couponImage
                couponTitle
                couponBadge
                Spacer()
            }
            .padding()
        }
        .navigationTitle("쿠폰 상세")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            downloadButton
        }
    }

    @ViewBuilder
    private var couponImage: some View {
        if let urlString = coupon.titleImage, let url = URL(string: urlString) {
            KFImage(url)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        } else {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .overlay {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.secondary)
                }
        }
    }

    private var couponTitle: some View {
        Text(coupon.name)
            .font(.title2.bold())
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }

    private var couponBadge: some View {
        Text(coupon.couponType == .pluspoint ? "포인트 적립" : "할인 쿠폰")
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.blue.opacity(0.1))
            .foregroundStyle(.blue)
            .clipShape(Capsule())
    }

    private var downloadButton: some View {
        Button {
            dismiss()
        } label: {
            Text("쿠폰 받기")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}
