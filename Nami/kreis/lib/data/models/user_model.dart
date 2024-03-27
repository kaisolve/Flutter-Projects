import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? fname;
  final String? lname;
  final String? phoneCode;
  final String? phone;
  final String? image;
  final String? invitationCode;
  final int? cityId;

  const UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.phoneCode,
    required this.phone,
    this.image,
    this.invitationCode,
    required this.cityId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fname: json['first_name'],
      lname: json['last_name'],
      phoneCode: json['phone_code'],
      phone: json['phone'],
      image: json['image'],
      invitationCode: json['invitation_code'],
      cityId: json['city_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': fname,
      'last_name': lname,
      'phone_code': phoneCode,
      'phone': phone,
      'image': image,
      'invitation_code': invitationCode,
      'city_id': cityId,
    };
  }

  @override
  List<Object?> get props =>
      [id, fname, lname, phoneCode, phone, image, invitationCode, cityId];
}
