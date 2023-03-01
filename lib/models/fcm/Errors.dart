/// deviceId : "Device id is Required"
/// token : "FCM Token is Required"

class Errors {
  Errors({
      this.deviceId, 
      this.token,});

  Errors.fromJson(dynamic json) {
    deviceId = json['deviceId'];
    token = json['token'];
  }
  String? deviceId;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceId'] = deviceId;
    map['token'] = token;
    return map;
  }

}