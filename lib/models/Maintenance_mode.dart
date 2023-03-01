/// status : true
/// message : "Record Found"
/// maintenance_mode : "1"

class MaintenanceModel {
  MaintenanceModel({
      this.status, 
      this.message, 
      this.maintenanceMode,});

  MaintenanceModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    maintenanceMode = json['maintenance_mode'];
  }
  bool? status;
  String? message;
  String? maintenanceMode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['maintenance_mode'] = maintenanceMode;
    return map;
  }

}