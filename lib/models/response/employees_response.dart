// To parse this JSON data, do
//
//     final createEmployee = createEmployeeFromJson(jsonString);

import 'dart:convert';

List<CreateEmployee> createEmployeeFromJson(String str) => List<CreateEmployee>.from(json.decode(str).map((x) => CreateEmployee.fromJson(x)));

String createEmployeeToJson(List<CreateEmployee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateEmployee {
    String id;
    String name;
    String email;
    String profilePic;
    String yearOfExperience;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    CreateEmployee({
        required this.id,
        required this.name,
        required this.email,
        required this.profilePic,
        required this.yearOfExperience,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory CreateEmployee.fromJson(Map<String, dynamic> json) => CreateEmployee(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        profilePic: json["profilePic"],
        yearOfExperience: json["yearOfExperience"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "profilePic": profilePic,
        "yearOfExperience": yearOfExperience,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
