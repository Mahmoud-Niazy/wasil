import 'package:dartz/dartz.dart';
import 'package:wasil/core/use_case/use_case.dart';
import 'package:wasil/features/auth/data/models/user_model.dart';
import '../../../../core/failure/failure.dart';
import '../repos/auth_repo.dart';

class UserSignUpUseCase extends UseCase<UserModel,Map<String,dynamic>>{
  final AuthRepo authRepo ;

  UserSignUpUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call([Map<String, dynamic>? param])async {
    return await authRepo.userSignUp(param!);
  }

}