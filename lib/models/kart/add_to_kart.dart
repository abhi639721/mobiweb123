class AddToKartModel {
    String message;
    bool status;

    AddToKartModel({required this.message, required this.status});

    factory AddToKartModel.fromJson(Map<String, dynamic> json) {
        return AddToKartModel(
            message: json['message']??"Server Error",
            status: json['status']?? false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        return data;
    }
}