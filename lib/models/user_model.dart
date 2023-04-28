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
  String? bio;
  String? country;
  String? county;
  String? subcounty;
  int? yearsOfExperience;
  int? consultationFee;
  int? totalReviews;
  int? totalRatings;
  List<String>? workingDays;

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
      this.age,
      this.workingDays,
      this.subcounty,
      this.county,
      this.country,
      this.yearsOfExperience,
      this.bio,
      this.consultationFee,
      this.totalRatings,
      this.totalReviews});

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
        bio: json["bio"] == null ? null : json["bio"],
        country: json["country"] == null ? null : json["country"],
        county: json["county"] == null ? null : json["county"],
        subcounty: json["subcounty"] == null ? null : json["subcounty"],
        yearsOfExperience: json["yearsOfExperience"] ,
        consultationFee: json["consultationFee"],
        totalReviews: json["totalReviews"] ,
        totalRatings: json["totalRatings"],
        workingDays: json["workingDays"] == null ? [] : List<String>.from(json["workingDays"].map((e)=>e)),
        type: json["type"],
        isVerified: json["isVerified"],
        isPhoneVerified: json["isPhoneVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
