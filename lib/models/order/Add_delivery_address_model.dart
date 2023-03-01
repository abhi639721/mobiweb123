/// status : true
/// message : "Addresss added successfully"

class AddDeliveryAddressModel {
  AddDeliveryAddressModel({
      this.status, 
      this.message,});

  AddDeliveryAddressModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}