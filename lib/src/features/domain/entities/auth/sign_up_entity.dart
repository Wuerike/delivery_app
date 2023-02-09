import 'dart:convert';

class SignUpEntity {
  SignUpEntity({
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
  });

  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;

  factory SignUpEntity.fromJson(String str) => SignUpEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpEntity.fromMap(Map<String, dynamic> json) => SignUpEntity(
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toMap() => {
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
      };
}
