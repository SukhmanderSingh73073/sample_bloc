import 'dart:async';

import 'package:demobloc/repo/profile_repo.dart';
import 'package:demobloc/repo/transaction_repo.dart';
import 'package:get_it/get_it.dart';

typedef AppRunner = FutureOr<void> Function();

class Injector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  /// All Repositories register here for use anywhere in the project
  /// ** Simple to use ***
  /// --- final repo = GetIt.I.<[RepositoryName]>.get();

  static Future<void> _initDependencies() async {
    // Local storage
    // final storage = await SharedPrefStorage.init();
    // GetIt.I.registerLazySingleton<LocalStorag>(() => storage);

    // Repository
    GetIt.I.registerSingleton<ProfileRepository>(ProfileDataRepository());
    GetIt.I.registerSingleton<TransactionRepository>(TransactionDataRepository());
    await GetIt.I.allReady();
  }
}
