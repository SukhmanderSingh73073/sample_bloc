part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterList extends RegisterEvent {
  Map<String , String> map ;
  RegisterList(this.map);
  @override
  // TODO: implement props
  List<Object?> get props => [map];


}
