import 'package:get/get.dart';
import 'package:regiform/common/controllers/dbcontroller.dart';



class CreateUser extends GetxController{
  String? username;
  String? email;
  String? uid;

  final Dbcontroller _dbcontroller = Get.put(Dbcontroller());

//This method is used to create the user in firestore
  Future<void> createUser() async {
    //Creates the user doc named whatever the user uid is in te collection "users"
    //and adds the user data
    await _dbcontroller.db
        .collection("users")
        .doc(uid)
        .set({'username': username, 'email': email});
  }
}
