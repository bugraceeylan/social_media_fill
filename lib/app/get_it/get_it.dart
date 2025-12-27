import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo_impl.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/pk/viewmodel/pk_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';

import 'package:fill_store_bb/app/screen/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:fill_store_bb/app/screen/splash/viewmodel/splash_viewmodel.dart';
import 'package:fill_store_bb/app/screen/story/viewmodel/story_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupViewModel();
  setupRepository();
}

void setupViewModel() {
  getIt.registerLazySingleton<SplashViewModel>(
    () => SplashViewModel(),
  );

  getIt.registerLazySingleton<MainViewModel>(
    () => MainViewModel(),
  );
  getIt.registerLazySingleton<SignInViewModel>(
    () => SignInViewModel(),
  );
  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(),
  );
  getIt.registerLazySingleton<ProfileViewModel>(
    () => ProfileViewModel(),
  );
  getIt.registerLazySingleton<SafariViewModel>(
    () => SafariViewModel(),
  );
  getIt.registerLazySingleton<PKViewModel>(
    () => PKViewModel(),
  );
  getIt.registerLazySingleton<StoryViewModel>(
    () => StoryViewModel(),
  );
}

void setupRepository() {
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(),
  );
}
// void setupRepository() {
//   getIt
//     ..registerLazySingleton<AssetsRepository>(
//       () => AssetRepositoryImpl(),
//     )
//     ..registerLazySingleton<AuthenticationRepository>(
//       () => AuthRepositoryImpl(),
//     )
//     ..registerLazySingleton<UserRepository>(
//       () => UserRepositoryImpl(),
//     )
//     ..registerLazySingleton<MatchRepository>(
//       () => MatchRepositoryImpl(),
//     )
//     ..registerLazySingleton<AgoraTokenRepository>(
//       () => AgoraTokenRepositoryImpl(),
//     );
// }

// void setupServices() {
//   getIt.registerLazySingleton<AssetsDatasource>(
//     () => AssetLocalDatasourceImpl(),
//   );
//   getIt.registerLazySingleton<AssetsDatasource>(
//     () => AssetRemoteDatasourceImpl(),
//   );
// }
