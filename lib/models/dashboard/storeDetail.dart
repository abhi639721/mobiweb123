import 'Data.dart';

class StoreDetailModel {
    DataResponse? data;
    String message;
    bool status;

    StoreDetailModel({this.data, required this.message, required this.status});

    factory StoreDetailModel.fromJson(Map<String, dynamic> json) {
        return StoreDetailModel(
            data: json['data'] != null ? DataResponse.fromJson(json['data']) : null,
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if (data.isNotEmpty) {
            data['`data`'] = this.data?.toJson();
        }
        return data;
    }
}