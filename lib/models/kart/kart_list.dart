import 'KartData.dart';

class KartModel {
    int grandTotal;
    String name;
    String mobile;
    String address;
    String deliveryAs;
    List<KartData>? kartData;
    String message;
    bool status;

    KartModel({
        required this.grandTotal,
        required this.kartData,
        required this.message,
        required this.status,
        required this.name,
        required this.mobile,
        required this.address,
        required this.deliveryAs
    });

    factory KartModel.fromJson(Map<String, dynamic> json) {
        return KartModel(
            grandTotal: json['grandTotal']??"0",
            name: json['name']??"",
            mobile: json['mobile']??"",
            address: json['address']??"",
            deliveryAs: json['deliveryAs']??"",
            kartData: json['data'] != null ? (json['data'] as List).map((i) => KartData.fromJson(i)).toList() : [],
            message: json['message']??"",
            status: json['status']??false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['grandTotal'] = grandTotal;
        data['name'] = name;
        data['mobile'] = mobile;
        data['address'] = address;
        data['deliveryAs'] = deliveryAs;
        data['message'] =  message;
        data['status'] = status;
        if (kartData != null) {
            data['data'] = kartData!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}