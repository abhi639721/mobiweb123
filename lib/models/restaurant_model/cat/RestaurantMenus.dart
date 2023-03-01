/// restaurantId : "1"
/// restaurantMenuId : "1"
/// itemName : "Burger"
/// itemPrice : "130.00"
/// productDescription : "iuhiu"
/// image : "https://jumpq.ai/assets/frontend/images/restaurants.png"

class RestaurantMenus {
  RestaurantMenus({
      this.restaurantId, 
      this.restaurantMenuId, 
      this.itemName, 
      this.itemPrice, 
      this.productDescription, 
      this.image,});

  RestaurantMenus.fromJson(dynamic json) {
    restaurantId = json['restaurantId'];
    restaurantMenuId = json['restaurantMenuId'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    productDescription = json['productDescription'];
    image = json['image'];
  }
  String? restaurantId;
  String? restaurantMenuId;
  String? itemName;
  String? itemPrice;
  String? productDescription;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurantId'] = restaurantId;
    map['restaurantMenuId'] = restaurantMenuId;
    map['itemName'] = itemName;
    map['itemPrice'] = itemPrice;
    map['productDescription'] = productDescription;
    map['image'] = image;
    return map;
  }

}