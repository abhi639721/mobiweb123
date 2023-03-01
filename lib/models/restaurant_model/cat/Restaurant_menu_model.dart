import 'Data.dart';

/// status : true
/// message : "Record Found"
/// data : {"details":{"restaurantName":"House of Tales","address":"Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad","image":"https://jumpq.ai/assets/uploads/stores/01.jpg"},"menuCategories":[{"id":"2","category":"Burger","icons":null},{"id":"1","category":"Pizza","icons":null},{"id":"1","category":"Pizza","icons":null}],"restaurantMenus":[{"restaurantId":"1","restaurantMenuId":"1","itemName":"Burger","itemPrice":"130.00","productDescription":"iuhiu","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"},{"restaurantId":"1","restaurantMenuId":"2","itemName":"Pizza","itemPrice":"149.00","productDescription":"Regular Size","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"},{"restaurantId":"1","restaurantMenuId":"3","itemName":"Pizza Pasta","itemPrice":"130.00","productDescription":"Regular Size","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"}]}

class RestaurantMenuModel {
  RestaurantMenuModel({
      this.status, 
      this.message, 
      this.data,});

  RestaurantMenuModel.fromJson(dynamic json) {
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