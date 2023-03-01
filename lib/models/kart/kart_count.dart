class KartCount {
    int cartCount;
    String message;
    bool status;

    KartCount({required this.cartCount, required this.message, required this.status});

    factory KartCount.fromJson(Map<String, dynamic> json) {
        return KartCount(
            cartCount: json['cartCount'], 
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cartCount'] = cartCount;
        data['message'] = message;
        data['status'] = status;
        return data;
    }
}