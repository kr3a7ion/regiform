import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/dbcontroller.dart';

class FetchUserDataModel {
  User? user;
  String? userCollection;

  final Dbcontroller _db = Get.put(Dbcontroller());

  FetchUserDataModel() {
    // Initialize the user with the currently logged-in user
    user = FirebaseAuth.instance.currentUser;
    userCollection = 'users';
  }

  //Function for logging in a user
  Future<Map<String, dynamic>?> fetchUserData() async {
    //Get the user doc with the uid of the user that just logged in
    if (user == null) {
      print('No user is logged in');
      return null;
    }

    try {
      // Get the user doc with the UID of the logged-in user
      DocumentReference ref = _db.db.collection(userCollection!).doc(user?.uid);
      DocumentSnapshot snapshot = await ref.get();

      // Check if the document exists and return its data
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>?;
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw Exception(e);
    }
  }
}
