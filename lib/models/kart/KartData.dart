class KartData {
    String cart_id;
    String image;
    String  price;
    String itemName;
    String  quantity;
    String store_product_id;
    String total;

    KartData({required this.cart_id, required this.image, required this.price, required this.itemName, required this.quantity, required this.store_product_id, required this.total});

    factory KartData.fromJson(Map<String, dynamic> json) {
        return KartData(
            cart_id: json['cart_id']??"",
            image: json['image']??"",
            price: json['price']??"",
            itemName: json['itemName']??"",
            quantity: json['quantity']??"",
            store_product_id: json['store_product_id']??"",
            total: json['total']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['cart_id'] = cart_id;
        data['image'] = image;
        data['price'] = price;
        data['itemName'] = itemName;
        data['quantity'] = quantity;
        data['store_product_id'] = store_product_id;
        data['total'] = total;
        return data;
    }
}