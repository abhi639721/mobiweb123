/// status : true
/// message : "Message sent!"

class HelpModel {
  HelpModel({
      this.status, 
      this.message,});

  HelpModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;
HelpModel copyWith({  bool? status,
  String? message,
}) => HelpModel(  status: status ?? this.status,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}