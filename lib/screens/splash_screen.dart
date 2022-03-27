import 'dart:async';

import 'package:demobloc/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:demobloc/screens/login_screen.dart';
import 'package:demobloc/screens/profile_screen.dart';
import 'package:demobloc/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/profile/profile_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2) , check) ;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: (){},
              child: Text("Splash Screen"))),
    );
  }

  void check() {

    BlocProvider.of<ProfileBloc>(context)
        .add(GetProfile("1")) ;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (c) => ProfileScreen())) ;


    // Navigator.push(
    //     context, MaterialPageRoute(builder: (c) => const TransactionScreen()));
  }
}
