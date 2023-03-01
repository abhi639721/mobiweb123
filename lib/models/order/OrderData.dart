class OrderData {
    String orderId;
    String orderNo;
    String orderedDate;
    bool paymentStatus;
    String storeName;
    String  totalAmount;
    String orderedTime;
    String storeImage;
    String storeAddress;



    OrderData({required this.orderId, required this.orderNo, required this.orderedDate, required this.paymentStatus, required this.storeName,required this.totalAmount,required this.orderedTime,required this.storeAddress,required this.storeImage});

    factory OrderData.fromJson(Map<String, dynamic> json) {
        return OrderData(
            orderId: json['orderId']??"",
            orderNo: json['orderNo']??"",
            orderedDate: json['orderedDate']??"",
            paymentStatus: json['paymentStatus']?? false,
            storeName: json['storeName']??"",
            totalAmount: json['totalAmount']??0,
            orderedTime: json['orderedTime']??"",
            storeAddress: json['storeAddress']??"",
            storeImage: json['storeImage']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['orderId'] = orderId;
        data['orderNo'] = orderNo;
        data['orderedDate'] = orderedDate;
        data['paymentStatus'] = paymentStatus;
        data['storeName'] = storeName;
        data['totalAmount'] = totalAmount;
        data['orderedTime'] = orderedTime;
        return data;
    }
}