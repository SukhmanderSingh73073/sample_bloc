part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent {
  String id ;
  GetProfile(this.id);

  @override
  List<Object?> get props => [id] ;
}