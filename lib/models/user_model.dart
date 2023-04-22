class UserModel {
  String? id;
  String? email;
  String? username;
  String? phone;
  String? dob;
  String? gender;
  String? profileImage;
  String? age;
  String? type;
  bool? isVerified = false;
  bool? isPhoneVerified = false;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel(
      {this.id,
      this.type,
      this.username,
      this.email,
      this.phone,
      this.dob,
      this.gender,
      this.createdAt,
      this.isPhoneVerified,
      this.isVerified,
      this.updatedAt,
      this.profileImage,
      this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        age: json["age"] == null ? null : json["age"],
        profileImage:
            json["profileImage"] == null ? null : json["profileImage"],
        phone: json["phone"],
        dob: json["dob"] == null ? null : json["dob"],
        gender: json["gender"] == null ? null : json["gender"],
        type: json["type"],
        isVerified: json["isVerified"],
        isPhoneVerified: json["isPhoneVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
