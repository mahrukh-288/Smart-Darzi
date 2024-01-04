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