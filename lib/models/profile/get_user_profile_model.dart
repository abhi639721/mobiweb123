import 'ProfileData.dart';

class UserProfileModel {
    String message;
    List<ProfileData>? profileData;
    bool status;

    UserProfileModel({required this.message, required this.profileData, required this.status});

    factory UserProfileModel.fromJson(Map<String, dynamic> json) {
        return UserProfileModel(
            message: json['message'], 
            profileData: json['data'] != null ? (json['data'] as List).map((i) => ProfileData.fromJson(i)).toList() : null,
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['status'] = status;
        if (profileData != null) {
            data['data'] = profileData?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}