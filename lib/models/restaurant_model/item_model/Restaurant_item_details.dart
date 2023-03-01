import 'Data.dart';

/// status : true
/// message : "Record Found"
/// data : {"restaurantId":"1","restaurantMenuId":"2","itemName":"Pizza","itemPrice":"149.00","itemDescription":"Regular Size","image":"https://jumpq.ai/assets/frontend/images/restaurants.png","options":[{"options":"Regular","price":"199.00"},{"options":"Medium","price":"299.00"},{"options":"Large","price":"399.00"}]}

class RestaurantItemDetails {
  RestaurantItemDetails({
      this.status, 
      this.message, 
      this.data,});

  RestaurantItemDetails.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ItemData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  ItemData? data;

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