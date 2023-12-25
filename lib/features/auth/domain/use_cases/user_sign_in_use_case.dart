import 'package:dartz/dartz.dart';
import 'package:wasil/core/failure/failure.dart';
import 'package:wasil/core/use_case/use_case.dart';
import 'package:wasil/features/auth/data/models/user_model.dart';

import '../repos/auth_repo.dart';

class UserSignInUseCase extends UseCase<UserModel, Map<String, dynamic>> {
  final AuthRepo authRepo;

  UserSignInUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call([Map<String, dynamic>? param]) async {
    return await authRepo.userSignIn(param!);
  }
}
