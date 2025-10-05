// To parse this JSON data, do
//
//     final mListUser = mListUserFromJson(jsonString);

import 'dart:convert';

MListUser mListUserFromJson(String str) => MListUser.fromJson(json.decode(str));

String mListUserToJson(MListUser data) => json.encode(data.toJson());

class MListUser {
    bool? status;
    String? msg;
    Data? data;

    MListUser({
        this.status,
        this.msg,
        this.data,
    });

    factory MListUser.fromJson(Map<String, dynamic> json) => MListUser(
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
    int? nextPage;
    List<Datauser>? data;

    Data({
        this.nextPage,
        this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextPage: json["next_page"],
        data: json["data"] == null ? [] : List<Datauser>.from(json["data"]!.map((x) => Datauser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "next_page": nextPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datauser {
    int? id;
    String? name;
    String? email;
    String? level;
    DateTime? createdAt;
    String? profileImage;

    Datauser({
        this.id,
        this.name,
        this.email,
        this.level,
        this.createdAt,
        this.profileImage,
    });

    factory Datauser.fromJson(Map<String, dynamic> json) => Datauser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        level: json["level"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "level": level,
        "created_at": createdAt?.toIso8601String(),
        "profile_image": profileImage,
    };
}
