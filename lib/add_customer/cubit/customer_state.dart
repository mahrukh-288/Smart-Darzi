part of 'customer_cubit.dart';

// @immutable
// sealed class CustomerState {}

// final class CustomerInitial extends CustomerState {}
// final class CustomerRegistered extends CustomerState {}



abstract class CustomerState extends Equatable {
  const CustomerState();
}

class CustomerInitial extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerRegistered extends CustomerState {
  @override
  List<Object> get props => [];
}

class LoggedIn extends CustomerState {
  @override
  List<Object> get props => [];
}

class Failure extends CustomerState {
  @override
  List<Object> get props => [];
}
class Loading extends CustomerState {
  @override
  List<Object> get props => [];
}