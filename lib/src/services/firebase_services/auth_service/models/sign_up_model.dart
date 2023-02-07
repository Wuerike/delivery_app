import 'dart:convert';

class SignUpModel {
  SignUpModel({
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  factory SignUpModel.fromJson(String str) => SignUpModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
      );

  Map<String, dynamic> toMap() => {
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "localId": localId,
      };
}
