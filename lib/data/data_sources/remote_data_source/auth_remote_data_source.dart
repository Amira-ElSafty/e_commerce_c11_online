import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/RegisterResponseEntity.dart';
import '../../../domain/entities/LoginResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,RegisterResponseEntity>> register(String name ,
      String email , String password,
      String rePassword , String phone);

  Future<Either<Failures,LoginResponseEntity>> login(String email , String password,);


}