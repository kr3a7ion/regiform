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
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0), // Frost effect
                child: Container(
                  color: Colors.white.withOpacity(
                      0.3), // Optional white overlay with transparency
                ),
              ),
            ),
            // Frosted glass effect using BackdropFilter

            // the form pageview
            PageView(
              clipBehavior: Clip.antiAlias,
              onPageChanged: (value) {
                _mypagecontroller.changeIndex(value);
              },
              controller: _mypagecontroller.pageController,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 250, right: 250),
                  child: customWelcome(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage1(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage01(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage02(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage2(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage3(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage4(
                    context,
                    _mypagecontroller.pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 150,
                  ),
                  child: customregformPage5(
                      context, _mypagecontroller.pageController, 5),
                ),
              ],
            ),
            Obx(
              () => _mypagecontroller.theIndex.value != 0
                  ? Positioned(
                      child: Container(
                      padding: EdgeInsets.only(top: 90, left: 20),
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width / 5,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Personal Details', style: TextStyle(
                          ),),
                          SizedBox(height: 10),
                          Text('Identification Details'),
                          SizedBox(height: 10),
                          Text('Address Details'),
                          SizedBox(height: 10),
                          Text('Travel Details'),
                          SizedBox(height: 10),
                          Text('Accomodation Details'),
                          SizedBox(height: 10),
                          Text('Payment Details'),
                          SizedBox(height: 10),
                          Text('Signature Details'),
                        ],
                      ),
                    ))
                  : SizedBox.shrink(),
            ),

            // logout button and username widgets
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: appLogo(
                            logoHeight: 50,
                            logoWidth: 50,
                          ),
                        ),
                        smallText16(
                          'RegiForm',
                          theColor: custompurpleColor,
                          theSize: 18,
                          theFontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.person_pin,
                                color: custompurpleColor,
                                size: 80,
                              ),
                              smallText16(
                                'KREATION',
                                // _signInController.currentUserName.value.toUpperCase(),
                                theColor: custompurpleColor,
                                theSize: 18,
                                theFontWeight: FontWeight.w900,
                              ),
                            ],
                          ),
                          Obx(() => _mypagecontroller.theIndex.value == 0
                              ? GestureDetector(
                                  onDoubleTap: () {
                                    _signInController.signOutUser();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.logout_rounded,
                                          color: Colors.red,
                                        ),
                                        smallText16(
                                          'Logout',
                                          theColor: custompurpleColor,
                                          theSize: 16,
                                          theFontWeight: FontWeight.w900,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox.shrink()),
                        ]),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
