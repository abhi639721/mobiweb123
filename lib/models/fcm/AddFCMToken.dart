import 'Errors.dart';

/// status : false
/// message : "fields are Required."
/// errors : {"deviceId":"Device id is Required","token":"FCM Token is Required"}

class AddFcmToken {
  AddFcmToken({
      this.status, 
      this.message, 
      this.errors,});

  AddFcmToken.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool? status;
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}