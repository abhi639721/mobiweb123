class CouponData {
    String couponCode;
    String couponName;
    String discount;

    CouponData({required this.couponCode, required this.couponName, required this.discount});

    factory CouponData.fromJson(Map<String, dynamic> json) {
        return CouponData(
            couponCode: json['couponCode']??"",
            couponName: json['couponName']??"",
            discount: json['discount']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['couponCode'] = couponCode;
        data['couponName'] = couponName;
        data['discount'] = discount;
        return data;
    }
}