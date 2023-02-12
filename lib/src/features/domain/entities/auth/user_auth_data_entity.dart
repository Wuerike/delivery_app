import 'dart:convert';

class UserAuthDataEntity {
  UserAuthDataEntity({
    required this.users,
  });

  List<User> users;

  factory UserAuthDataEntity.fromRawJson(String str) => UserAuthDataEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserAuthDataEntity.fromJson(Map<String, dynamic> json) => UserAuthDataEntity(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.localId,
    required this.email,
    required this.passwordHash,
    required this.emailVerified,
    required this.passwordUpdatedAt,
    required this.providerUserInfo,
    required this.validSince,
    required this.lastLoginAt,
    required this.createdAt,
    required this.lastRefreshAt,
  });

  String localId;
  String email;
  String passwordHash;
  bool emailVerified;
  int passwordUpdatedAt;
  List<ProviderUserInfo> providerUserInfo;
  String validSince;
  String lastLoginAt;
  String createdAt;
  DateTime lastRefreshAt;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"],
        email: json["email"],
        passwordHash: json["passwordHash"],
        emailVerified: json["emailVerified"],
        passwordUpdatedAt: json["passwordUpdatedAt"],
        providerUserInfo:
            List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x))),
        validSince: json["validSince"],
        lastLoginAt: json["lastLoginAt"],
        createdAt: json["createdAt"],
        lastRefreshAt: DateTime.parse(json["lastRefreshAt"]),
      );

  Map<String, dynamic> toJson() => {
        "localId": localId,
        "email": email,
        "passwordHash": passwordHash,
        "emailVerified": emailVerified,
        "passwordUpdatedAt": passwordUpdatedAt,
        "providerUserInfo": List<dynamic>.from(providerUserInfo.map((x) => x.toJson())),
        "validSince": validSince,
        "lastLoginAt": lastLoginAt,
        "createdAt": createdAt,
        "lastRefreshAt": lastRefreshAt.toIso8601String(),
      };
}

class ProviderUserInfo {
  ProviderUserInfo({
    required this.providerId,
    required this.federatedId,
    required this.email,
    required this.rawId,
  });

  String providerId;
  String federatedId;
  String email;
  String rawId;

  factory ProviderUserInfo.fromRawJson(String str) => ProviderUserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
        providerId: json["providerId"],
        federatedId: json["federatedId"],
        email: json["email"],
        rawId: json["rawId"],
      );

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "federatedId": federatedId,
        "email": email,
        "rawId": rawId,
      };
}
