import 'package:jump_q/models/payment/Data.dart';

class CommonResponseModel {
  Data? data;
  String message;
  bool status ;

  CommonResponseModel({this.data,required this.message, required this.status,});

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) {
    return CommonResponseModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message']??"",
      status: json['status']??"",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}