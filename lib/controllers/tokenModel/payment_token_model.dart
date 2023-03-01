class PaymentTokenModel {
    String cftoken;
    String message;
    String status;

    PaymentTokenModel({required this.cftoken,required this.message, required this.status});

    factory PaymentTokenModel.fromJson(Map<String, dynamic> json) {
        return PaymentTokenModel(
            cftoken: json['cftoken']??"",
            message: json['message']??"",
            status: json['status']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['cftoken'] = cftoken;
        data['message'] = message;
        data['status'] = status;
        return data;
    }
}