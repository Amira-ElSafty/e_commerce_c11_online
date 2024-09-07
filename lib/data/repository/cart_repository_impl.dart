import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    // TODO: implement deleteItemInCart
    var either = await cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    // TODO: implement updateCountInCart
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
