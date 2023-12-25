import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo{
 Future<Either<Failure,UserModel>> userSignUp(Map<String,dynamic> userData);

 Future<Either<Failure,UserModel>> userSignIn(Map<String,dynamic> userData);
}