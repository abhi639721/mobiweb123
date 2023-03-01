/// options : "Regular"
/// price : "199.00"

class Options {
  Options({
      this.options, 
      this.price,});

  Options.fromJson(dynamic json) {
    options = json['options'];
    price = json['price'];
  }
  String? options;
  String? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['options'] = options;
    map['price'] = price;
    return map;
  }

}