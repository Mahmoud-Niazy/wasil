import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:wasil/core/failure/failure.dart';
import 'package:wasil/features/auth/data/data_source/auth_data_source.dart';

import 'package:wasil/features/auth/data/models/user_model.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo{
  AuthDataSource authDataSource ;
  AuthRepoImp(this.authDataSource);
  @override
  Future<Either<Failure, UserModel>> userSignUp(Map<String, dynamic> userData)async {
    try{
      var data = await  authDataSource.userSignUp(userData);
      return right(data);
    }
        catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      return left(Failure(
        error.toString(),
      ));
        }
  }

  @override
  Future<Either<Failure, UserModel>> userSignIn(Map<String, dynamic> userData)async {
    try{
      var data = await authDataSource.userSignIn(userData);
      return right(data);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      return left(Failure(
        error.toString(),
      ));
    }
  }

}