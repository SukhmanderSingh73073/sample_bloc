part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSucess extends RegisterState {

  UserModel user ;
  RegisterSucess(this.user);
  @override
  List<Object> get props => [user];
}

class RegisterFailed extends RegisterState {
  String error ;
  RegisterFailed(this.error);

  @override
  List<Object> get props => [error];
}

