// To parse this JSON data, do
//
//     final mAll = mAllFromJson(jsonString);

import 'dart:convert';

MAll mAllFromJson(String str) => MAll.fromJson(json.decode(str));

String mAllToJson(MAll data) => json.encode(data.toJson());

class MAll {
    bool? status;
    String? msg;
    List<dynamic>? data;

    MAll({
        this.status,
        this.msg,
        this.data,
    });

    factory MAll.fromJson(Map<String, dynamic> json) => MAll(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}
