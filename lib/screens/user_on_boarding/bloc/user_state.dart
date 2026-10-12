abstract class UserState {}

class UserInitialState extends UserState{}
class UserLoadingState extends UserState{}
class UserSuccessState extends UserState{}
class UserFailureState extends UserState{
  String errMsg;
  UserFailureState({required this.errMsg});
}