import 'dart:convert';

class SignUpResponse {
  SignUpResponse({
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

  factory SignUpResponse.fromJson(String str) => SignUpResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpResponse.fromMap(Map<String, dynamic> json) => SignUpResponse(
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
