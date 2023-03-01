import 'package:jump_q/models/dashboard/store_data.dart';

class HomePageStoreModel {
    List<StoreData>? data=[];
    String message="Server error";
    bool status=false;

    HomePageStoreModel({required this.data, required this.message, required this.status});

    factory HomePageStoreModel.fromJson(Map<String, dynamic> json) {
        return HomePageStoreModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => StoreData.fromJson(i)).toList() : null,
            message: json['message']??"Server error",
            status: json['status']??false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if(this.data!=null){
            data['data'] = this.data?.map((v) => v.toJson()).toList();
        }else{
            data['data'] = [];
        }

        return data;
    }
}