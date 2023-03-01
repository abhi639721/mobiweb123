class Details {
    String address;
    String latitude;
    String longitude;
    String image;
    String store_name;

    Details({required this.address,required this.latitude, required this.longitude,required this.image, required this.store_name});

    factory Details.fromJson(Map<String, dynamic> json) {
        return Details(
            address: json['address']??"",
            latitude: json['latitude']??"",
            longitude: json['longitude']??"",
            image: json['image']??"",
            store_name: json['store_name']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = address;
        data['latitude'] = latitude;
        data['longitude'] = longitude;
        data['image'] = image;
        data['store_name'] = store_name;
        return data;
    }
}