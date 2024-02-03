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
  final String error;
  const Failure({required this.error});
  @override
  List<Object> get props => [error];
}

class FailureInDeletingCustomer extends CustomerState {
  final String error;
  const FailureInDeletingCustomer({required this.error});
  @override
  List<Object> get props => [error];
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
  final String message;
  const SizeSaved({required this.message});
  @override
  List<Object> get props => [message];
}

class SizeNotAvailable extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerFetchedByPhone extends CustomerState {
  final Customer customer;
  const CustomerFetchedByPhone({required this.customer});
  @override
  List<Object> get props => [customer];
}

class CustomerSizeFetched extends CustomerState {
  final SizeModel size;
  const CustomerSizeFetched({required this.size});
  @override
  List<Object> get props => [size];
}

class CustomerNotAvailable extends CustomerState {
  final bool available;
  const CustomerNotAvailable({required this.available});
  @override
  List<Object> get props => [available];
}

class CustomerDeleted extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerProfileFetched extends CustomerState {
  final CustomerProfileModel profile;
  const CustomerProfileFetched({required this.profile});
  @override
  List<Object> get props => [profile];
}
