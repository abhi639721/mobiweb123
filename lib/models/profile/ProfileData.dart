class ProfileData {
    String address;
    String email;
    String mobile;
    String profilePic;
    String status;
    String userId;
    String username;

    ProfileData({required this.address, required this.email, required this.mobile, required this.profilePic, required this.status, required this.userId, required this.username});

    factory ProfileData.fromJson(Map<String, dynamic> json) {
        return ProfileData(
            address: json['address']??"",
            email: json['email']??"",
            mobile: json['mobile']??"",
            profilePic: json['profilePic']??"",
            status: json['status']??"",
            userId: json['userId']??"",
            username: json['username']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['address'] = address;
        data['email'] = email;
        data['mobile'] = mobile;
        data['profilePic'] = profilePic;
        data['status'] = status;
        data['userId'] = userId;
        data['username'] = username;
        return data;
    }
}