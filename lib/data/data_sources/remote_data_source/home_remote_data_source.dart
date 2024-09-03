import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import '../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();

}