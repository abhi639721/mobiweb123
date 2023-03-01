import 'Details.dart';
import 'MenuCategories.dart';
import 'RestaurantMenus.dart';

/// details : {"restaurantName":"House of Tales","address":"Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad","image":"https://jumpq.ai/assets/uploads/stores/01.jpg"}
/// menuCategories : [{"id":"2","category":"Burger","icons":null},{"id":"1","category":"Pizza","icons":null},{"id":"1","category":"Pizza","icons":null}]
/// restaurantMenus : [{"restaurantId":"1","restaurantMenuId":"1","itemName":"Burger","itemPrice":"130.00","productDescription":"iuhiu","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"},{"restaurantId":"1","restaurantMenuId":"2","itemName":"Pizza","itemPrice":"149.00","productDescription":"Regular Size","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"},{"restaurantId":"1","restaurantMenuId":"3","itemName":"Pizza Pasta","itemPrice":"130.00","productDescription":"Regular Size","image":"https://jumpq.ai/assets/frontend/images/restaurants.png"}]

class Data {
  Data({
      this.details, 
      this.menuCategories, 
      this.restaurantMenus,});

  Data.fromJson(dynamic json) {
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    if (json['menuCategories'] != null) {
      menuCategories = [];
      json['menuCategories'].forEach((v) {
        menuCategories?.add(MenuCategories.fromJson(v));
      });
    }
    if (json['restaurantMenus'] != null) {
      restaurantMenus =  [];
      json['restaurantMenus'].forEach((v) {
        restaurantMenus?.add(RestaurantMenus.fromJson(v));
      });
    }
  }
  Details? details;
  List<MenuCategories>? menuCategories;
  List<RestaurantMenus>? restaurantMenus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (details != null) {
      map['details'] = details?.toJson();
    }
    if (menuCategories != null) {
      map['menuCategories'] = menuCategories?.map((v) => v.toJson()).toList();
    }
    if (restaurantMenus != null) {
      map['restaurantMenus'] = restaurantMenus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}