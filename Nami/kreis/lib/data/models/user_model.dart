class UserModel {
  String? fname;
  String? lname;
  String? phoneCode;
  String? phone;
  String? image;
  String? invitationCode;
  int? cityId;
  UserModel(
      {required this.fname,
      required this.lname,
      required this.phoneCode,
      required this.phone,
      this.image,
      this.invitationCode,
      required this.cityId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        fname: json['first_name'],
        lname: json['last_name'],
        phoneCode: json['phone_code'],
        phone: json['phone'],
        image: json['image'],
        invitationCode: json['invitation_code'],
        cityId: json['city_id']);
  }
  Map<String, dynamic> toJson() {
    return {
      'first_name': fname,
      'last_name': lname,
      'phone_code': phoneCode,
      'phone': phone,
      'image': image,
      'invitation_code': invitationCode,
      'city_id': cityId
    };
  }
}
