import 'dart:convert';

import 'dropdown_item.dart';

class Commons {
  Commons({
    this.status,
    this.statusCode,
    this.message,
    this.positions,
    this.skills,
    this.sources,
  });

  final String? status;
  final int? statusCode;
  final String? message;
  final List<DropdownItem>? positions;
  final List<DropdownItem>? skills;
  final List<DropdownItem>? sources;

  factory Commons.fromRawJson(String str) => Commons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commons.fromJson(Map<String, dynamic> json) => Commons(
    status: json["status"],
    statusCode: json["statusCode"],
    message: json["message"],
    positions: json["positions"] == null ? [] : List<DropdownItem>.from(json["positions"]!.map((x) => DropdownItem.fromJson(x))),
    skills: json["skills"] == null ? [] : List<DropdownItem>.from(json["skills"]!.map((x) => DropdownItem.fromJson(x))),
    sources: json["sources"] == null ? [] : List<DropdownItem>.from(json["sources"]!.map((x) => DropdownItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "positions": positions == null ? [] : List<dynamic>.from(positions!.map((x) => x.toJson())),
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
    "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
  };
}


