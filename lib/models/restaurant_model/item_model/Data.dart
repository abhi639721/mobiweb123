import 'Options.dart';

/// restaurantId : "1"
/// restaurantMenuId : "2"
/// itemName : "Pizza"
/// itemPrice : "149.00"
/// itemDescription : "Regular Size"
/// image : "https://jumpq.ai/assets/frontend/images/restaurants.png"
/// options : [{"options":"Regular","price":"199.00"},{"options":"Medium","price":"299.00"},{"options":"Large","price":"399.00"}]

class ItemData {
  ItemData({
      this.restaurantId, 
      this.restaurantMenuId, 
      this.itemName, 
      this.itemPrice, 
      this.itemDescription, 
      this.image, 
      this.options,});

  ItemData.fromJson(dynamic json) {
    restaurantId = json['restaurantId'];
    restaurantMenuId = json['restaurantMenuId'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    itemDescription = json['itemDescription'];
    image = json['image'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
  }
  String? restaurantId;
  String? restaurantMenuId;
  String? itemName;
  String? itemPrice;
  String? itemDescription;
  String? image;
  List<Options>? options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurantId'] = restaurantId;
    map['restaurantMenuId'] = restaurantMenuId;
    map['itemName'] = itemName;
    map['itemPrice'] = itemPrice;
    map['itemDescription'] = itemDescription;
    map['image'] = image;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}