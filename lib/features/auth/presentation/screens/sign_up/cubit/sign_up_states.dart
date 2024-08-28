import 'package:flutter_e_commerce_c11_online/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  Failures failures ;
  RegisterErrorState({required this.failures});
}
class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity responseEntity ;
  RegisterSuccessState({required this.responseEntity});
}