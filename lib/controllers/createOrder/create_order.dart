import 'CreateData.dart';

class CreateOrder {
    CreateData? createData;
    String message;
    bool status;

    CreateOrder({required this.createData, required this.message, required this.status});

    factory CreateOrder.fromJson(Map<String, dynamic> json) {
        return CreateOrder(
            createData: json['data'] != null ? CreateData.fromJson(json['data']) : null,
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if (createData != null) {
            data['createData'] = createData?.toJson();
        }
        return data;
    }
}