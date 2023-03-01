class OffersData {
    String id;
    String offerImage;
    int storeId;

    OffersData({required this.id, required this.offerImage, required this.storeId});

    factory OffersData.fromJson(Map<String, dynamic> json) {
        return OffersData(
            id: json['id']??0,
            offerImage: json['offerImage']??"",
            storeId: json['storeId']??0,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['offerImage'] = offerImage;
        data['storeId'] = storeId;
        return data;
    }
}