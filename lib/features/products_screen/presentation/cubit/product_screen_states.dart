import 'package:flutter_e_commerce_c11_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';

abstract class ProductScreenStates {}

class ProductInitialState extends ProductScreenStates {}

class ProductLoadingState extends ProductScreenStates {}

class ProductErrorState extends ProductScreenStates {
  Failures failures;

  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductScreenStates {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductScreenStates {}

class AddToCartErrorState extends ProductScreenStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductScreenStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}
