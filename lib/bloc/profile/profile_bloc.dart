import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demobloc/model/profile_model.dart';
import 'package:demobloc/repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  var repo  = GetIt.I.get<ProfileRepository>() ;
  ProfileBloc() : super(ProfileInitial()){
    on<GetProfile>(getProfile);
  }

  Future<FutureOr<void>> getProfile(
      GetProfile event, Emitter<ProfileState> emit) async {
    try{
      emit(ProfileLoader()) ;
      final model = await repo.getUserData( event.id) ;
      if(model==null){
        emit(ProfileFailed("Api error")) ;
      }else{
        emit(ProfileSucess(model)) ;
      }
    }catch(e){
      emit(ProfileFailed(e.toString())) ;
    }


  }


}
