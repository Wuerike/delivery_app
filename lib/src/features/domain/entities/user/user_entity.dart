import 'dart:convert';

class UserEntity {
  UserEntity({
    this.userId,
    this.role,
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.billingAddress,
    this.idToken,
  });

  String? userId;
  String? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? idToken;

  factory UserEntity.fromJson(String str) => UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
      userId: json["userId"],
      role: json["role"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      dateOfBirth: json["dateOfBirth"],
      startDate: json["startDate"],
      photo: json["photo"],
      shippingAddress: json["shippingAddress"],
      billingAddress: json["billingAddress"],
      idToken: json["idToken"]);

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "role": role,
        "username": username,
        "email": email,
        "phone": phone,
        "dateOfBirth": dateOfBirth,
        "startDate": startDate,
        "photo": photo,
        "shippingAddress": shippingAddress,
        "billingAddress": billingAddress,
        "idToken": billingAddress == null ? null : idToken,
      };
}

enum UserRole { user, owner, admin, rider }

extension ParseToString on UserRole {
  String value() {
    return toString().split('.').last;
  }
}
