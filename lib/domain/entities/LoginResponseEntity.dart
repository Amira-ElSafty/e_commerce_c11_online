import 'package:flutter_e_commerce_c11_online/data/model/RegisterResponseDM.dart';

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  String? message;
  String? statusMsg;
  LoginUserEntity? user;
  String? token;

}

class LoginUserEntity {
  LoginUserEntity({
      this.name, 
      this.email, 
      });

  String? name;
  String? email;

}