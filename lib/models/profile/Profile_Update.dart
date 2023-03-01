/// status : true
/// message : "Profile Updated Successfully"

class ProfileUpdateModel {
  ProfileUpdateModel({
      this.status, 
      this.message,});
  ProfileUpdateModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;
ProfileUpdateModel copyWith({  bool? status,
  String? message,
}) => ProfileUpdateModel(  status: status ?? this.status,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}