part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object?> get props => [];
}

final class EmployeeInitial extends EmployeeState {}

class EmployeeAdding extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeAdded extends EmployeeState {
  final List<CreateEmployee> employees;
  EmployeeAdded(this.employees);
  @override
  List<Object?> get props => [employees];
}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<CreateEmployee> employees;
  EmployeeLoaded(this.employees);
  @override
  List<Object?> get props => [employees];
}

class EmployeeError extends EmployeeState {
  final String error;
  EmployeeError(this.error);
  List<Object?> get props => [error];
}
