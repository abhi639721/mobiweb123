class Offer {
    String couponCode;
    String couponName;
    String createdOn;
    String discount;
    String validFrom;
    String validTill;

    Offer({required this.couponCode, required this.couponName, required this.createdOn, required this.discount, required this.validFrom, required this.validTill});

    factory Offer.fromJson(Map<String, dynamic> json) {
        return Offer(
            couponCode: json['couponCode']??"",
            couponName: json['couponName']??"",
            createdOn: json['createdOn']??"",
            discount: json['discount']??"",
            validFrom: json['validFrom']??"",
            validTill: json['validTill']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['couponCode'] = couponCode;
        data['couponName'] = couponName;
        data['createdOn'] = createdOn;
        data['discount'] = discount;
        data['validFrom'] = validFrom;
        data['validTill'] = validTill;
        return data;
    }
}