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
class LoadingCustomer extends CustomerState {
  @override
  List<Object> get props => [];
}
class AllCustomersFetched extends CustomerState {
  final List<Customer> customers;
  const AllCustomersFetched({required this.customers});
  @override
  List<Object> get props => [customers];
}
class SizeSaved extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerFetchedByPhone extends CustomerState {
  final Customer customer;
  const CustomerFetchedByPhone({required this.customer});
  @override
  List<Object> get props => [customer];
}