import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_in_use_case.dart';
import 'package:wasil/features/auth/presentation/manager/user_sign_in_bloc/user_sign_in_states.dart';

class UserSignInBloc extends Cubit<UserSignInStates> {
  UserSignInBloc(this.userSignInUseCase) : super(UserSignInInitialState());

  static UserSignInBloc get(context) => BlocProvider.of(context);

  final UserSignInUseCase userSignInUseCase;

  userSignIn(Map<String, dynamic> userData) async {
    emit(UserSignInLoadingState());
    var data = await userSignInUseCase(userData);
    data.fold(
      (failure) => emit(UserSignInErrorState(failure.errorMessage)),
      (userData) => emit(UserSignInSuccessfullyState(userData)),
    );
  }
}
