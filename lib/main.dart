import 'package:demobloc/bloc/profile/profile_bloc.dart';
import 'package:demobloc/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:demobloc/screens/splash_screen.dart';
import 'package:demobloc/screens/transaction_screen.dart';
import 'package:demobloc/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bloc/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  await Injector.init(appRunner: () => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          /// All Blocs are register here
          BlocProvider(create: (c) => TransactionBloc()),
          BlocProvider(create: (c) => ProfileBloc()) ,
        ],
        child: GetMaterialApp(
          title: 'Sample Bloc',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.indigo ,
            primaryColor: AppColors.primaryColor ,
            platform: TargetPlatform.iOS,
            canvasColor: Colors.transparent
          ),
          home: const SplashScreen(),
        ));
  }
}
