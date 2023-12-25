import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_up_use_case.dart';
import 'package:wasil/features/auth/presentation/manager/user_sign_up_bloc/user_sign_up_states.dart';

class UserSignUpBloc extends Cubit<UserSignUpStates> {
  UserSignUpBloc(this.userSignUpUseCase) : super(UserSignUpInitialState());

  static UserSignUpBloc get(context) => BlocProvider.of(context);

  final UserSignUpUseCase userSignUpUseCase;

  userSignUp(Map<String,dynamic> userData) async {
    emit(UserSignUpLoadingState());
    var data = await userSignUpUseCase(userData);

    data.fold(
      (failure) => emit(UserSignUpErrorState(failure.errorMessage),),
      (userData) => emit(UserSignUpSuccessfullyState(userData),),
    );
  }
}
