class UserImageModel {
    String message;
    String profilePic;
    bool status;

    UserImageModel({required this.message, required this.profilePic, required this.status});

    factory UserImageModel.fromJson(Map<String, dynamic> json) {
        return UserImageModel(
            message: json['message']??"",
            profilePic: json['profilePic']??"",
            status: json['status']??false,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['message'] = message;
        data['profilePic'] = profilePic;
        data['status'] = status;
        return data;
    }
}