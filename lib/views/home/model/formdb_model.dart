import 'package:get/get.dart';
import 'package:regiform/common/controllers/dbcontroller.dart';

class GuestFormData extends GetxController {
  String? fullname;
  String? passportId;
  String? mobile;
  String? email;
  String? address;
  String? sex;
  String? uid;

  final Dbcontroller _dbcontroller = Get.put(Dbcontroller());

//This method is used to create the user in firestore
  Future<void> createFormData() async {
    //Creates the user doc named whatever the user uid is in te collection "users"
    //and adds the user data
    await _dbcontroller.db.collection("form data").doc(uid).set({
      'username': fullname,
      'passportId': passportId,
      'mobile': mobile,
      'email': email,
      'address': address,
      'sex': sex,
    });
  }
}
