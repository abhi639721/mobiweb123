class KartUpdateModel {
    String grandTotal;
    String message;
    bool status;

    KartUpdateModel({required this.grandTotal, required this.message, required this.status});

    factory KartUpdateModel.fromJson(Map<String, dynamic> json) {
        return KartUpdateModel(
            grandTotal: json['grandTotal']??"0",
            message: json['message']??"",
            status: json['status']??false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  <String, dynamic>{};
        data['grandTotal'] = grandTotal;
        data['message'] = message;
        data['status'] = status;
        return data;
    }
}