import 'OffersData.dart';

class OffersModel {
    String message;
    List<OffersData> offersData;
    bool status;

    OffersModel({required this.message, required this.offersData, required this.status});

    factory OffersModel.fromJson(Map<String, dynamic> json) {
        return OffersModel(
            message: json['message']??"",
            offersData: json['data'] != null ? (json['data'] as List).map((i) => OffersData.fromJson(i)).toList() : [],
            status: json['status']??false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
          data['data'] = offersData.map((v) => v.toJson()).toList();
        return data;
    }
}