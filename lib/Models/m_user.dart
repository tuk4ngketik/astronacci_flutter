// To parse this JSON data, do
//
//     final mUser = mUserFromJson(jsonString);

import 'dart:convert';

MUser mUserFromJson(String str) => MUser.fromJson(json.decode(str));

String mUserToJson(MUser data) => json.encode(data.toJson());

class MUser {
    bool? status;
    String? msg;
    Data? data;

    MUser({
        this.status,
        this.msg,
        this.data,
    });

    factory MUser.fromJson(Map<String, dynamic> json) => MUser(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    String? level;
    String? profileImage;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.level,
        this.profileImage,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        level: json["level"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "level": level,
        "profile_image": profileImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
