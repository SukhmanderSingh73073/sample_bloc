import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demobloc/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../bloc/profile/profile_bloc.dart';

abstract class ProfileRepository {
  Future<ProfileModel?> getUserData
      (String CustomerId) ;
}
class ProfileDataRepository extends ProfileRepository{

  Future<ProfileModel?> getUserData(String CustomerId) async {

    try {
      var url = "https://reqres.in/api/users/" +CustomerId ;
      final response = await http.get(Uri.parse(url)) ;
      print("response>>>>>> ${response.body}");
      // ProfileModel  model = jsonDecode(response.body) ;
      // return model ;
      return ProfileModel.fromJson(jsonDecode(response.body)) ;

    }catch(e){
      print('$e');
    }
    throw UnimplementedError();


  }
}