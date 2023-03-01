
/// restaurantName : "House of Tales"
/// address : "Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad"
/// image : "https://jumpq.ai/assets/uploads/stores/01.jpg"


class Details {
  Details({
    this.restaurantName,
    this.address,
    this.latitude,
    this.longitude,
    this.image,});

  Details.fromJson(dynamic json) {
    restaurantName = json['restaurantName'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
  }
  String? restaurantName;
  String? address;
  String? latitude;
  String? longitude;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurantName'] = restaurantName;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['image'] = image;
    return map;
  }

}