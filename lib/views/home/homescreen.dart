import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/widgets/applogo.dart';
import 'package:regiform/common/widgets/reusable_popscope.dart';
import 'package:regiform/views/home/controllers/mypagecontroller.dart';
import 'package:regiform/views/home/widget/formpage.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final SignInController _signInController = Get.put(SignInController());
  final Mypagecontroller _mypagecontroller = Get.put(Mypagecontroller());

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressed;
    return customPopScope(
      () {
        _signInController.signOutUser();
      },
      lastPressed: lastPressed,
      context: context,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(children: [
            // Background image
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backgrounds/newbk.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Frosted glass effect using BackdropFilter
            BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0), // Frost effect
              child: Container(
                color: Colors.white.withOpacity(
                    0.3), // Optional white overlay with transparency
              ),
            ),

            // the form pageview
            PageView(
              clipBehavior: Clip.antiAlias,
              onPageChanged: (value) {
                _mypagecontroller.changeIndex(value);
              },
              controller: _mypagecontroller.pageController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customWelcome(
                    context,
                    _mypagecontroller.pageController,
                    theIndex: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customregformPage1(
                    context,
                    _mypagecontroller.pageController,
                    theIndex: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customregformPage01(
                    context,
                    _mypagecontroller.pageController,
                    theIndex: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customregformPage02(
                    context,
                    _mypagecontroller.pageController,
                    theIndex: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customregformPage2(
                      context, _mypagecontroller.pageController,
                      theIndex: 5,),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 250,
                  ),
                  child: customregformPage3(
                    context,
                    _mypagecontroller.pageController,
                    theIndex: 6,
                  ),
                ),
              ],
            ),

            // logout button and username widgets
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    largeButton(
                        thebuttonHeight: 55,
                        thewidth: 130,
                        theText: 'Log out',
                        onTapped: () {
                          _signInController.signOutUser();
                        }),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: appLogo(
                          logoHeight: 40,
                          logoWidth: 40,
                        ),
                      ),
                      smallText16(
                        'Logged in as: ${_signInController.currentUserName.value.toUpperCase()}',
                        //'Logged in as: Gideon'.toUpperCase(),
                        theColor: custompurpleColor,
                        theSize: 16,
                        theFontWeight: FontWeight.w900,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
