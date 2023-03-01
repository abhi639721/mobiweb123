class OrderHistoryData {
    String orderId;
    String total;
    String productName;
    String productPrice;
    String quantity;
    String totalAmount;

    OrderHistoryData({required this.orderId,required this.total,required this.productName,required this.productPrice, required this.quantity,required this.totalAmount});

    factory OrderHistoryData.fromJson(Map<String, dynamic> json) {
        return OrderHistoryData(
            orderId: json['orderId']??"",
            total: json['total']??"",
            productName: json['productName']??"",
            productPrice: json['productPrice']??"",
            quantity: json['quantity']??"",
            totalAmount: json['totalAmount']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['orderId'] = orderId;
        data['total'] = total;
        data['productName'] = productName;
        data['productPrice'] = productPrice;
        data['quantity'] = quantity;
        data['totalAmount'] = totalAmount;
        return data;
    }
}