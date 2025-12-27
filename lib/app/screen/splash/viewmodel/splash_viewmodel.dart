import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/core/device_config/device_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/view/login_view.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/sign_in/view/sign_in_view.dart';
import 'package:mobx/mobx.dart';
part 'splash_viewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  @observable
  String obb = "";
  @action
  Future<void> init() async {
    initialization();
  }

  final _userRepository = getIt.get<UserRepository>();

  bool user = false;
  @observable
  bool noNetwork = false;
  @action
  Future initialization() async {
    printHiveUserBox();
    noNetwork = false;
    await checkUserStatus();
    await Future.delayed(const Duration(milliseconds: 200));
    if (!noNetwork) {
      Navigation.pushReplace(
          page: user ? const MainView() : const SignInView());
    }
  }

  void printHiveUserBox() {
    if (!userBox.isOpen) {
      print("userBox is not open!");
      return;
    }

    print("-------- Hive userBox Content --------");
    for (var key in userBox.keys) {
      var value = userBox.get(key);
      print("Key: $key");
      print("Value: $value");
    }
    print("-------- End of userBox Content --------");
  }

  @action
  Future<void> checkUserStatus() async {
    var deviceId = await DeviceInfoService().getDeviceId();
    var currentUser = await _userRepository.currentUser();
    var dataResult = await _userRepository.getByDeviceId(deviceId ?? "");

    if (!currentUser.success) {
      if (dataResult.message == "timeout") {
        noNetwork = true;
        user = false;
      } else {
        if (dataResult.success) {
          await _userRepository.create(dataResult.data!);
          user = true;
          print("veri alınamadı");
          return;
        }
      }
    } else {
      if (dataResult.success) {
        if (dataResult.data != currentUser.data) {
          await _userRepository.update(dataResult.data!);
          noNetwork = false;
          print("veri alınamadı");
          return;
        }
        user = true;
      } else {
        noNetwork = true;
        print("dataResult.message = ${dataResult.message}");
        print("dataResult.success = ${dataResult.success}");
      }
    }
  }
}
