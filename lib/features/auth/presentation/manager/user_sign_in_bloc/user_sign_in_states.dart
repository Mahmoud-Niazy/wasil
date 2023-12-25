import 'package:wasil/features/auth/data/models/user_model.dart';

abstract class UserSignInStates{}

class UserSignInInitialState extends UserSignInStates{}

class UserSignInLoadingState extends UserSignInStates{}
class UserSignInSuccessfullyState extends UserSignInStates{
  final UserModel userData;
  UserSignInSuccessfullyState(this.userData);
}
class UserSignInErrorState extends UserSignInStates{
  final String error;
  UserSignInErrorState(this.error);
}