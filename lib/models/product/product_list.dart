import 'ProductData.dart';

class ProductListModel {
    String message;
    List<ProductData>? productData;
    bool status;

    ProductListModel({required this.message,  this.productData, required this.status});

    factory ProductListModel.fromJson(Map<String, dynamic> json) {
        return ProductListModel(
            message: json['message'],
            productData: json['data'] != null ? (json['data'] as List).map((i) => ProductData.fromJson(i)).toList() : [],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if (productData != null) {
            data['data'] = productData?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}