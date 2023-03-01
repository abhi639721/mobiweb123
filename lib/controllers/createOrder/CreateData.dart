class CreateData {
    String orderAmount;
    String orderCurrency;
    int orderId;

    CreateData({required this.orderAmount, required this.orderCurrency, required this.orderId});

    factory CreateData.fromJson(Map<String, dynamic> json) {
        return CreateData(
            orderAmount: json['orderAmount']??"0",
            orderCurrency: json['orderCurrency']??"INR",
            orderId: json['orderId']??0,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['orderAmount'] = orderAmount;
        data['orderCurrency'] = orderCurrency;
        data['orderId'] = orderId;
        return data;
    }
}