import 'package:get/get.dart';
import 'package:regiform/common/controllers/dbcontroller.dart';

class GuestFormData extends GetxController {
  String? firstname;
  String? othernames;
  String? lastname;
  String? dateofbirth;
  String? sex;
  String? mobile;
  String? email;
  String? passportId;
  String? address;

  String? uid;

  final Dbcontroller _dbcontroller = Get.put(Dbcontroller());

//This method is used to create the user in firestore
  Future<bool> createFormData() async {
    //Creates the user doc named whatever the user uid is in te collection "users"
    //and adds the user data
    await _dbcontroller.db.collection("Guestdata").doc(uid).set({
      'firstname': firstname,
      'othernames': othernames,
      'lastname': lastname,
      'dateOfbirth': dateofbirth,
      'sex': sex,
      'mobile': mobile,
      'email': email,
      'passportId': passportId,
      'address': address,
    });

    return true;
  }
}
