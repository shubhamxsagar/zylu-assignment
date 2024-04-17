import 'package:employee/features/home/bloc/employee_bloc.dart';
import 'package:employee/features/home/widgets/text_field.dart';
import 'package:employee/models/request/create_employee_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: AlertDialog(
            actions: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Add Employee',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              LoginField(
                hintText: 'Name',
                controller: nameController,
                obscureText: false,
                background: false,
              ),
              const SizedBox(height: 40),
              LoginField(
                hintText: 'Email',
                controller: emailController,
                obscureText: false,
                background: false,
              ),
              const SizedBox(height: 40),
              LoginField(
                hintText: 'Year of Experience',
                controller: yearController,
                obscureText: false,
                background: false,
              ),
              const SizedBox(height: 40),
              Center(
                child: BlocBuilder<EmployeeBloc, EmployeeState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<EmployeeBloc>(context).add(Create(
                              createEmployeeRequest: CreateEmployeeRequest(
                            email: emailController.text,
                            name: nameController.text,
                            yearOfExperience: yearController.text,
                          )));

                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add Employeee'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
