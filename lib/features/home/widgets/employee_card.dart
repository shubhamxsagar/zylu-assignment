import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmployeeCard extends StatelessWidget {
  final String name;
  final String email;
  final String profilePic;
  final String yearOfExperience;
  const EmployeeCard(
      {Key? key,
      required this.name,
      required this.email,
      required this.profilePic,
      required this.yearOfExperience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int experience = int.tryParse(yearOfExperience) ?? 0;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
          color: experience > 5 ? Colors.green : Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profilePic),
            ),
            title: Text(
              name,
              style: TextStyle(
                  color: experience > 5 ? Colors.white : Colors.black),
            ),
            subtitle: Text(email,
                style: TextStyle(
                    color: experience > 5 ? Colors.white : Colors.black)),
            trailing: Text(yearOfExperience,
                style: TextStyle(
                    color: experience > 5 ? Colors.white : Colors.black)),
            // trailing: Icon(Icons.arrow_forward_ios),
          )),
    );
  }
}
