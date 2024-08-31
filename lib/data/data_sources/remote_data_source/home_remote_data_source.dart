import 'package:dartz/dartz.dart';
import '../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();

}