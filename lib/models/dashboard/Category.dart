class Category {
    String categoryId="";
    String categoryImage="";
    String categoryName="";
    String storeId="";

    Category({required this.categoryId, required this.categoryImage, required this.categoryName,required this.storeId});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            categoryId: json['categoryId']??"",
            categoryImage: json['categoryImage']??"",
            categoryName: json['categoryName']??"",
            storeId: json['storeId']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['categoryId'] = categoryId;
        data['categoryImage'] = categoryImage;
        data['categoryName'] = categoryName;
        data['storeId'] = storeId;
        return data;
    }
}