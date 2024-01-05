import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_darzi/app_repository/app_repository.dart';
import 'package:equatable/equatable.dart';
import '../../models/api_response.dart';
import '../../models/customer.dart';
import '../../models/size.dart';

part 'customer_state.dart';
AppRepository _appRepository = AppRepository();
class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  registerCustomer(Customer customer) async {
    emit(LoadingCustomer());
 ApiResponse response   = await _appRepository.registerCustomer(customer);
 if(response.isSuccess){
emit(CustomerRegistered());
 }else{
  emit(Failure());
 }
    
  }
  getAllCustomers() async {
    emit(LoadingCustomer());
 ApiResponse response   = await _appRepository.getAllCustomers();
 if(response.isSuccess){
  print('response in state');
emit(AllCustomersFetched(customers: response.data));
 }else{
  emit(Failure());
 }
    
  }

  login(String name, String password)async {
emit(LoadingCustomer());
    ApiResponse response = await _appRepository.login(name,password);
    if(response.isSuccess) {
      emit(LoggedIn());
    } 
    else{
      emit(Failure());
    }
  }

  saveSize(SizeModel size) async {
print(size.toJson());
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.saveSize(size);
    if(response.isSuccess) {
      print(state);
      emit(SizeSaved());
    } 
    else{
      emit(Failure());
    }
  }
}
