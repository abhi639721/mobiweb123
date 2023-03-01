import 'OrderData.dart';

class OrderHistoryModel {
    String message;
    List<OrderData>? orderData;
    bool status;

    OrderHistoryModel({required this.message, required this.orderData, required this.status});

    factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
        return OrderHistoryModel(
            message: json['message'], 
            orderData: json['data'] != null ? (json['data'] as List).map((i) => OrderData.fromJson(i)).toList() : [],
            status: json['status'], 
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if (orderData!.isNotEmpty) {
            data['data'] = orderData?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}