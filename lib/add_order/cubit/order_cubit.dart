import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_darzi/app_repository/app_repository.dart';
import 'package:smart_darzi/app_service/app_service.dart';
import 'package:equatable/equatable.dart';
import '../../models/api_response.dart';
import '../../models/order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  AppRepository _appRepository = AppRepository();
  OrderCubit() : super(OrderInitial());


  addOrder(Order order)async {
    print('cubit');
    ApiResponse response = await _appRepository.addOrder(order);
    if(response.isSuccess){
      
    
      emit(OrderAdded());
    }
  }

  getAllOrders() async {
ApiResponse response = await _appRepository.getAllOrders();
if(response.isSuccess){
    
      emit(AllOrdersFetched(orders: response.data ));
    }
  }
}
