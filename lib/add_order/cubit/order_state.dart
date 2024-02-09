part of 'order_cubit.dart';



abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderAdded extends OrderState {
  @override
  List<Object> get props => [];
}
class AllOrdersFetched extends OrderState {
  final List<Order> orders;
  const AllOrdersFetched({required this.orders});
  @override
  List<Object> get props => [orders];
}
class LoadingOrder extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderFailure extends OrderState {
  @override
  List<Object> get props => [];
}
class OrdersByCustomerIdFetched extends OrderState {
  final List<Order> orders;
  const OrdersByCustomerIdFetched({required this.orders});
  @override
  List<Object> get props => [orders];
}

class AddEmbroidaryState extends OrderState {
  @override
  List<Object> get props => [];
}
class NoEmbroidaryState extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderRegistrationFailed extends OrderState {
  final String error;
  const OrderRegistrationFailed({required this.error});
  @override
  List<Object> get props => [error];
}