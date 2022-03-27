part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoader extends ProfileState {
  @override
  List<Object> get props => [];
}


class ProfileSucess extends ProfileState {
  ProfileModel model;
  ProfileSucess(this.model);
  @override
  List<Object> get props => [model];
}

class ProfileFailed extends ProfileState {
  String error ;
  ProfileFailed(this.error);
  @override
  List<Object> get props => [error] ;
}
