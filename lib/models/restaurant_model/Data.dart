/// restaurantId : "1"
/// restaurantName : "Birla Grocery Store"
/// address : "Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad"
/// image : "https://jumpq.ai/assets/uploads/stores/01.jpg"
/// timings : "Opens at 9 AM"
/// openStatus : "Open"
/// favourite : false
/// ratings : 1

class Data {
  Data({
      this.restaurantId, 
      this.restaurantName, 
      this.address, 
      this.image, 
      this.timings, 
      this.openStatus, 
      this.favourite, 
      this.ratings,});

  Data.fromJson(dynamic json) {
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    address = json['address'];
    image = json['image'];
    timings = json['timings'];
    openStatus = json['openStatus'];
    favourite = json['favourite'];
    ratings = json['ratings'];
  }
  String? restaurantId;
  String? restaurantName;
  String? address;
  String? image;
  String? timings;
  String? openStatus;
  bool? favourite;
  num? ratings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurantId'] = restaurantId;
    map['restaurantName'] = restaurantName;
    map['address'] = address;
    map['image'] = image;
    map['timings'] = timings;
    map['openStatus'] = openStatus;
    map['favourite'] = favourite;
    map['ratings'] = ratings;
    return map;
  }

}