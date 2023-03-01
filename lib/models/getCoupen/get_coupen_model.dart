import 'CoupenData.dart';

class CouponModel {
    List<CouponData> couponData;
    String message;
    bool status;

    CouponModel({required this.couponData, required this.message, required this.status});

    factory CouponModel.fromJson(Map<String, dynamic> json) {
        return CouponModel(
            couponData: json['data'] != null ? (json['data'] as List).map((i) => CouponData.fromJson(i)).toList() : [],
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['message'] = message;
        data['status'] = status;
          data['coupenData'] = this.couponData.map((v) => v.toJson()).toList();
        return data;
    }
}