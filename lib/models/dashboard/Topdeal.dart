class Topdeal {
    String id;
    String storeId;
    String couponName;
    String offerImage;

    Topdeal({required this.id, required this.storeId, required this.offerImage,required this.couponName});

    factory Topdeal.fromJson(Map<String, dynamic> json) {
        return Topdeal(
            id: json['id']??"",
            storeId: json['storeId']??"",
            offerImage: json['offerImage']??"",
            couponName: json['couponName']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['storeId'] = storeId;
        data['offerImage'] = offerImage;
        data['couponName'] = couponName;
        return data;
    }
}