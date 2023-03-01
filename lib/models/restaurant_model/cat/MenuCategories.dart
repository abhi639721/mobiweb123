/// id : "2"
/// category : "Burger"
/// icons : null

class MenuCategories {
  MenuCategories({
      this.id, 
      this.category, 
      this.icons,});

  MenuCategories.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    icons = json['icons'];
  }
  String? id;
  String? category;
  dynamic icons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['icons'] = icons;
    return map;
  }

}