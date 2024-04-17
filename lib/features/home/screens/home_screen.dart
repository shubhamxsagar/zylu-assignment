import 'package:employee/features/home/bloc/employee_bloc.dart';
import 'package:employee/features/home/screens/add_employee.dart';
import 'package:employee/features/home/widgets/employee_card.dart';
import 'package:employee/features/home/widgets/text_field.dart';
import 'package:employee/models/response/employees_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<EmployeeBloc>().add(FetchEmployees());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Stack(
        children: [
          BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) {
              if (state is EmployeeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is EmployeeError) {
                return Center(child: Text(state.error));
              } else if (state is EmployeeLoaded) {
                return _buildEmployeeList(state.employees);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
              bottom: 40,
              right: 40,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SignInScreen();
                    },
                  );
                },
                child: Text('Add Employee +'),
              ))
        ],
      ),
    );
  }
}

Widget _buildEmployeeList(List<CreateEmployee> employees) {
  return FutureBuilder<List<CreateEmployee>>(
    future: Future.value(employees),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        final List<CreateEmployee> employees = snapshot.data ?? [];
        return ListView.builder(
          itemCount: employees.length,
          itemBuilder: (context, index) {
            final CreateEmployee employee = employees[index];
            return EmployeeCard(
              email: employee.email,
              name: employee.name,
              profilePic: employee.profilePic,
              yearOfExperience: employee.yearOfExperience,
            );
            //  ListTile(
            //   title: Text(employee.name),
            //   subtitle: Text(employee.email),
            //   // Add more information as needed
            // );
          },
        );
      }
    },
  );
}
