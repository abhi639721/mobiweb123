import 'Data.dart';
import 'dart:convert';

/// status : true
/// message : "Payment Status updated successfully"
/// data : {"order_id":"1","user_id":"2","vendor_id":"1","store_id":"1","order_no":"ORD-1","token":212,"amount":"180","payment_time":"2022-10-16 05:28:01","status":1,"storeName":"Birla Grocery Store","storeImage":"https://jumpq.ai/assets/uploads/stores/01.jpg"}

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));
String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());
class PaymentModel {
  PaymentModel({
      this.status, 
      this.message, 
      this.data,});

  PaymentModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}