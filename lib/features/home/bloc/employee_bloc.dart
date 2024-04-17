import 'package:bloc/bloc.dart';
import 'package:employee/models/request/create_employee_request.dart';
import 'package:employee/models/response/employees_response.dart';
import 'package:employee/repository/create_employee_repo.dart';
import 'package:employee/repository/get_employee_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final CreateEmployeeRepository createEmployeeRepository;
  final GetEmployee getEmployee;
  EmployeeBloc(
      {required this.createEmployeeRepository, required this.getEmployee})
      : super(EmployeeInitial()) {
    on<Create>((event, emit) async {
      emit(EmployeeAdding());
      try {
        final List<CreateEmployee>? employees = await createEmployeeRepository
            .postEmployee(event.createEmployeeRequest);
        if (employees != null) {
          emit(EmployeeAdded(employees));
          add(FetchEmployees());
        } else {
          emit(EmployeeError("Failed to fetch employees"));
        }
        // await createEmployeeRepository
        //     .postEmployee(event.createEmployeeRequest);
      } catch (e) {
        emit(EmployeeError(e.toString()));
      }
    });

    on<FetchEmployees>((event, emit) async {
      emit(EmployeeLoading());
      try {
        final List<CreateEmployee>? employees = await getEmployee.getEmployee();
        if (employees != null) {
          emit(EmployeeLoaded(employees));
        } else {
          emit(EmployeeError("Failed to fetch employees"));
        }
      } catch (e) {
        emit(EmployeeError(e.toString()));
      }
    });
  }
}
