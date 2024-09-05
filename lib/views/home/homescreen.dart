import 'package:flutter/material.dart';
import 'package:regiform/views/login/model/user_data_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final DisplayUserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.grey,
              child: Center(
                child: Text("Welcome ${user.userName!}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
