import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';

abstract class ProductScreenStates{}
class ProductInitialState extends ProductScreenStates{}
class ProductLoadingState extends ProductScreenStates{}
class ProductErrorState extends ProductScreenStates{
  Failures failures ;
  ProductErrorState({required this.failures});
}
class ProductSuccessState extends ProductScreenStates {
  ProductResponseEntity productResponseEntity ;
  ProductSuccessState({required this.productResponseEntity});
}