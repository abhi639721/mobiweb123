class AddWishProductModel {
    String message;
    bool status;

    AddWishProductModel({required this.message, required this.status});

    factory AddWishProductModel.fromJson(Map<String, dynamic> json) {
        return AddWishProductModel(
            message: json['message']??"",
            status: json['status']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['message'] = message;
        data['status'] = status;
        return data;
    }
}