import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase{
  HomeRepository homeRepository ;
  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllBrands();
  }
}