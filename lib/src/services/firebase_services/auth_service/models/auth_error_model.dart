import 'dart:convert';

class AuthErrorModel {
  AuthErrorModel({
    this.error,
  });

  Error? error;

  factory AuthErrorModel.fromJson(String str) => AuthErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorModel.fromMap(Map<String, dynamic> json) => AuthErrorModel(
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error!.toMap(),
      };
}

class Error {
  Error({
    this.code,
    this.message,
    this.errors,
  });

  int? code;
  String? message;
  List<ErrorItem>? errors;

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        errors: json["errors"] == null ? null : List<ErrorItem>.from(json["errors"].map((x) => ErrorItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "errors": errors == null ? null : List<dynamic>.from(errors!.map((x) => x.toMap())),
      };
}

class ErrorItem {
  ErrorItem({
    this.message,
    this.domain,
    this.reason,
  });

  String? message;
  String? domain;
  String? reason;

  factory ErrorItem.fromJson(String str) => ErrorItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorItem.fromMap(Map<String, dynamic> json) => ErrorItem(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
