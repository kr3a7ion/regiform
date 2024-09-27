import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/views/home/controllers/mypagecontroller.dart';
import 'package:regiform/views/home/widget/formpage.dart';
// import 'package:regiform/views/home/controllers/home_controller.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final SignInController _signInController = Get.put(SignInController());
  final Mypagecontroller _mypagecontroller = Get.put(Mypagecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/newbk.png'),
                fit: BoxFit.fill)),
        child: SafeArea(
            child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      largeButton(
                          thebuttonHeight: 40,
                          thewidth: 120,
                          theText: 'Log out',
                          onTapped: () {
                            _signInController.signOutUser();
                          }),
                      smallText16(
                        'Logged In as: ${_signInController.currentUserName.value.toUpperCase()}',
                        theColor: Colors.black,
                        theSize: 16,
                        theFontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: PageView(
                  onPageChanged: (value) {
                    _mypagecontroller.changeIndex(value);
                  },
                  controller: _mypagecontroller.pageController,
                  children: [
                    regformPage(
                      context,
                      _mypagecontroller.pageController,
                      theIndex: 1,
                      theHeaderText: 'PERSONAL INFORMATION',
                    ),
                    regformPage(
                      context,
                      _mypagecontroller.pageController,
                      theIndex: 2,
                      // theHeaderText: 'Page Two',
                    ),
                    regformPage(
                      context,
                      _mypagecontroller.pageController,
                      theIndex: 3,
                      //theHeaderText: 'Page Three',
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
