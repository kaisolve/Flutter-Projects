class UserModel {
  String? fname;
  String? lname;
  String? phone;
  String? imagePic;
  String? uId;
  UserModel(
      {required this.fname,
      required this.lname,
      required this.phone,
      required this.imagePic,
      required this.uId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        fname: json['fname'] ?? '',
        lname: json['lname'] ?? '',
        phone: json['phone'] ?? '',
        imagePic: json['imagePic'] ?? '',
        uId: json['uId']);
  }
  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'imagePic': imagePic,
      'uId': uId
    };
  }
}
