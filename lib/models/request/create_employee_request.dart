// To parse this JSON data, do
//
//     final createEmployeeRequest = createEmployeeRequestFromJson(jsonString);

import 'dart:convert';

CreateEmployeeRequest createEmployeeRequestFromJson(String str) => CreateEmployeeRequest.fromJson(json.decode(str));

String createEmployeeRequestToJson(CreateEmployeeRequest data) => json.encode(data.toJson());

class CreateEmployeeRequest {
    String name;
    String email;
    String yearOfExperience;

    CreateEmployeeRequest({
        required this.name,
        required this.email,
        required this.yearOfExperience,
    });

    factory CreateEmployeeRequest.fromJson(Map<String, dynamic> json) => CreateEmployeeRequest(
        name: json["name"],
        email: json["email"],
        yearOfExperience: json["yearOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "yearOfExperience": yearOfExperience,
    };
}
