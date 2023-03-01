import 'OrderHistoryData.dart';

class OrderHistoryDetailModel {
    int discount;
    int grandTotal;
    String message;
    int totalItems;
    int paidAmount;
    String mobile;
    List<OrderHistoryData>? orderHistoryData=[];
    String orderNo;
    String orderedDate;
    String paymentType;
    bool status;
    String storeAddress;
    String storeName;
    String storeImage;

    OrderHistoryDetailModel({required this.discount, required this.grandTotal, required this.message, required this.totalItems,required this.paidAmount,required this.mobile, required this.orderHistoryData, required this.orderNo, required this.orderedDate,required this.paymentType,required this.status, required this.storeAddress, required this.storeName,required this.storeImage});

    factory OrderHistoryDetailModel.fromJson(Map<String, dynamic> json) {
        return OrderHistoryDetailModel(
            discount: json['discount']??"0",
            grandTotal: json['grandTotal']??"0",
            message: json['message']??"",
            totalItems: json['totalItems']??0,
            paidAmount: json['paidAmount']??0,
            mobile: json['mobile']??"",
            orderHistoryData: json['data'] != null ? (json['data'] as List).map((i) => OrderHistoryData.fromJson(i)).toList() : null,
            orderNo: json['orderNo']??"",
            orderedDate: json['orderedDate']??"",
            paymentType: json['paymentType']??"",
            status: json['status']??false,
            storeAddress: json['storeAddress']??"",
            storeName: json['storeName']??"",
            storeImage: json['storeImage']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['discount'] = discount;
        data['grandTotal'] = grandTotal;
        data['message'] = message;
        data['totalItems'] = totalItems;
        data['paidAmount'] = paidAmount;
        data['mobile'] = mobile;
        data['orderNo'] = orderNo;
        data['orderedDate'] = orderedDate;
        data['paymentType'] = paymentType;
        data['status'] = status;
        data['storeAddress'] =storeAddress;
        data['storeName'] = storeName;
        data['storeImage'] = storeImage;
        if (orderHistoryData != null) {
            data['data'] = orderHistoryData?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}