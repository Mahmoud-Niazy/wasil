import 'package:get_it/get_it.dart';
import 'package:wasil/features/auth/data/data_source/auth_data_source.dart';
import 'package:wasil/features/auth/data/repos/auth_repo_imp.dart';
import 'package:wasil/features/auth/domain/repos/auth_repo.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_in_use_case.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_up_use_case.dart';

import '../api_services/api_services.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Api Services
    serviceLocator.registerLazySingleton<ApiServices>(
      () => ApiServices(),
    );

    /// Data Source
    serviceLocator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImp(serviceLocator()),
    );

    /// Repos
    serviceLocator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(serviceLocator()),
    );

    /// Use Cases
    serviceLocator.registerLazySingleton<UserSignUpUseCase>(
      () => UserSignUpUseCase(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<UserSignInUseCase>(
          () => UserSignInUseCase(serviceLocator()),
    );
  }
}
