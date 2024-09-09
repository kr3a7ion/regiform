import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/authcontroller.dart';
import 'package:regiform/views/login/model/user_data_model.dart';

import '../../login/model/user_model.dart';

class HomeController extends GetxController {
  final Authcontroller _authcontroller = Get.put(Authcontroller());
  final FetchUserDataModel _fetchUserDataModel = FetchUserDataModel();

  final RxString currentUserData = ''.obs;
  final RxInt note = 0.obs;

  Future<void> getCurrentUser() async {
    // do {
    //   User? user = _authcontroller.authInstance.currentUser;
    //   print('This is running now');
    //   note.value++;
    //   print(note.value);
    //   if (user != null) {
    //     var userData = await _fetchUserDataModel.fetchUserData();
    //     DisplayUserData displayUserData = DisplayUserData.fromMap(userData!);
    //     currentUserData.value = displayUserData.userName!;
    //   }
    // } while (_authcontroller.authInstance.currentUser == null);

    while (_authcontroller.authInstance.currentUser != null) {
      User? user = _authcontroller.authInstance.currentUser;
      print('This is running now ${note.value}');
      note.value++;
      print(note.value);
      if (user != null) {
        var userData = await _fetchUserDataModel.fetchUserData();
        DisplayUserData displayUserData = DisplayUserData.fromMap(userData!);
        currentUserData.value = displayUserData.userName!;
      }
    }
  }
}
