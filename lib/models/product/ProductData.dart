class ProductData {
    String wishlistId="";
    String storeId;
    String storeProductId;
    String categoryId;
    String productName;
    String productDescription="";
    String salePrice;
    String productPrice;
    String image;
    bool status;
    String stock;
    String weight;

    ProductData({ wishlistId,required this.storeId, required this.storeProductId,required this.categoryId,required this.productName,required this.productDescription,required this.salePrice, required this.productPrice,required this.image, required this.status, required this.stock,required this.weight});

    factory ProductData.fromJson(Map<String, dynamic> json) {
        return ProductData(
            wishlistId: json['wishlistId']??"",
            storeId: json['storeId']??"",
            storeProductId: json['storeProductId']??"0",
            categoryId: json['categoryId']??"0",
            productName: json['productName']??"",
            productDescription: json['productDescription']??"",
            salePrice: json['salePrice']??"",
            productPrice: json['productPrice']??"",
            image: json['image']??"0",
            status: json['status']??"",
            stock: json['stock']??"",
            weight: json['weight']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['wishlistId'] = wishlistId;
        data['storeId'] = storeId;
        data['storeProductId'] = storeProductId;
        data['categoryId'] = categoryId;
        data['productName'] = productName;
        data['productDescription'] = productDescription;
        data['salePrice'] = salePrice;
        data['productPrice'] = productPrice;
        data['image'] = image;
        data['status'] = status;
        data['stock'] = stock;
        data['weight'] = weight;
        return data;
    }
}