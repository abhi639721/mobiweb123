import 'package:jump_q/models/product/ProductData.dart';

import 'Category.dart';
import 'Details.dart';
import 'Offer.dart';
import 'Topdeal.dart';

class DataResponse {
    List<Category>? categories;
    Details? details;
    List<Offer>? offers;
    List<Topdeal>? topdeals;
    List<ProductData>? storeProducts;

    DataResponse({required this.categories, required this.details, required this.offers, required this.topdeals,required this.storeProducts});

    factory DataResponse.fromJson(Map<String, dynamic> json) {
        return DataResponse(
            categories: json['categories'] != null ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList() : null, 
            details: json['details'] != null ? Details.fromJson(json['details']) : null, 
            offers: json['offers'] != null ? (json['offers'] as List).map((i) => Offer.fromJson(i)).toList() : null, 
            topdeals: json['topdeals'] != null ? (json['topdeals'] as List).map((i) => Topdeal.fromJson(i)).toList() : null,
            storeProducts: json['storeProducts'] != null ? (json['storeProducts'] as List).map((i) => ProductData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

            data['categories'] = categories?.map((v) => v.toJson()).toList();

          data['details'] = details?.toJson();
          data['offers'] = offers?.map((v) => v.toJson()).toList();
          data['topdeals'] = topdeals?.map((v) => v.toJson()).toList();
        data['storeProducts'] = storeProducts?.map((v) => v.toJson()).toList();
        return data;
    }
}