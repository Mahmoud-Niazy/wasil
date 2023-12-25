import '../../../data/models/user_model.dart';

abstract class UserSignUpStates{}

class UserSignUpInitialState extends UserSignUpStates{}

class UserSignUpLoadingState extends UserSignUpStates{}
class UserSignUpSuccessfullyState extends UserSignUpStates{
  final UserModel userData ;
  UserSignUpSuccessfullyState(this.userData);
}
class UserSignUpErrorState extends UserSignUpStates{
  final String error ;
  UserSignUpErrorState(this.error);
}