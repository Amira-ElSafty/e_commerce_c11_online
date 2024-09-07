import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';

abstract class HomeRepository{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}