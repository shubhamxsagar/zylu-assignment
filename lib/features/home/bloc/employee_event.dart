part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object?> get props => [];
}

class Create extends EmployeeEvent {
  final CreateEmployeeRequest createEmployeeRequest;
  Create({required this.createEmployeeRequest});

  @override
  List<Object?> get props => [createEmployeeRequest];
}

class FetchEmployees extends EmployeeEvent {}