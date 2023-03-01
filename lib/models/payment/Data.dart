import 'dart:convert';

/// order_id : "1"
/// user_id : "2"
/// vendor_id : "1"
/// store_id : "1"
/// order_no : "ORD-1"
/// token : 212
/// amount : "180"
/// payment_time : "2022-10-16 05:28:01"
/// status : 1
/// storeName : "Birla Grocery Store"
/// storeImage : "https://jumpq.ai/assets/uploads/stores/01.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.orderId, 
      this.userId, 
      this.vendorId, 
      this.storeId, 
      this.orderNo, 
      this.token, 
      this.amount, 
      this.paymentTime, 
      this.status, 
      this.storeName, 
      this.storeImage,});

  Data.fromJson(dynamic json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    storeId = json['store_id'];
    orderNo = json['order_no'];
    token = json['token'];
    amount = json['amount'];
    paymentTime = json['payment_time'];
    status = json['status'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
  }
  String? orderId;
  String? userId;
  String? vendorId;
  String? storeId;
  String? orderNo;
  int? token;
  String? amount;
  String? paymentTime;
  int? status;
  String? storeName;
  String? storeImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['user_id'] = userId;
    map['vendor_id'] = vendorId;
    map['store_id'] = storeId;
    map['order_no'] = orderNo;
    map['token'] = token;
    map['amount'] = amount;
    map['payment_time'] = paymentTime;
    map['status'] = status;
    map['storeName'] = storeName;
    map['storeImage'] = storeImage;
    return map;
  }

}