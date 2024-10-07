import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/widgets/applogo.dart';
import 'package:regiform/common/widgets/reusable_popscope.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';
import 'package:regiform/views/home/controllers/mypagecontroller.dart';
import 'package:regiform/views/home/widget/formpage.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final SignInController _signInController = Get.put(SignInController());
  final Mypagecontroller _mypagecontroller = Get.put(Mypagecontroller());
  final Homecontroller _homecontroller = Get.put(Homecontroller());

  final double sidepageIndicatorfontsize = 14;

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
                _homecontroller.completionStatus(value);
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
                          FittedBox(
                            child: smallText16('Personal Details',
                                theSize:
                                    _homecontroller.personalDetailsDone.value
                                        ? 16
                                        : sidepageIndicatorfontsize,
                                theColor:
                                    _homecontroller.personalDetailsDone.value
                                        ? customPurpleColor2
                                        : Colors.black,
                                theFontWeight:
                                    _homecontroller.personalDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Identification Details',
                                theSize: _homecontroller
                                        .identificationDetailsDone.value
                                    ? 16
                                    : sidepageIndicatorfontsize,
                                theColor: _homecontroller
                                        .identificationDetailsDone.value
                                    ? customPurpleColor2
                                    : Colors.black,
                                theFontWeight: _homecontroller
                                        .identificationDetailsDone.value
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Address Details',
                                theSize: _homecontroller.addressDetailsDone.value
                                    ? 16
                                    : sidepageIndicatorfontsize,
                                theColor: _homecontroller.addressDetailsDone.value
                                    ? customPurpleColor2
                                    : Colors.black,
                                theFontWeight:
                                    _homecontroller.addressDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Travel Details',
                                theSize: _homecontroller.travelDetailsDone.value
                                    ? 16
                                    : sidepageIndicatorfontsize,
                                theColor: _homecontroller.travelDetailsDone.value
                                    ? customPurpleColor2
                                    : Colors.black,
                                theFontWeight:
                                    _homecontroller.travelDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Accomodation Details',
                                theSize:
                                    _homecontroller.accomodationDetailsDone.value
                                        ? 16
                                        : sidepageIndicatorfontsize,
                                theColor:
                                    _homecontroller.accomodationDetailsDone.value
                                        ? customPurpleColor2
                                        : Colors.black,
                                theFontWeight:
                                    _homecontroller.accomodationDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Payment Details',
                                theSize: _homecontroller.paymentDetailsDone.value
                                    ? 16
                                    : sidepageIndicatorfontsize,
                                theColor: _homecontroller.paymentDetailsDone.value
                                    ? customPurpleColor2
                                    : Colors.black,
                                theFontWeight:
                                    _homecontroller.paymentDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          FittedBox(
                            child: smallText16('Signature Details',
                                theSize:
                                    _homecontroller.signatureDetailsDone.value
                                        ? 16
                                        : sidepageIndicatorfontsize,
                                theColor:
                                    _homecontroller.signatureDetailsDone.value
                                        ? customPurpleColor2
                                        : Colors.black,
                                theFontWeight:
                                    _homecontroller.signatureDetailsDone.value
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
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
                                // 'KREATION',
                                _signInController.currentUserName.value
                                    .toUpperCase(),
                                theColor: custompurpleColor,
                                theSize: 18,
                                theFontWeight: FontWeight.w900,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Obx(
                                () => _mypagecontroller.theIndex.value >= 1
                                    ? largeButton(
                                        thebuttonHeight: 50,
                                        thewidth: 100,
                                        theText:
                                            _mypagecontroller.theIndex.value ==
                                                    7
                                                ? 'Preview'
                                                : 'Next',
                                        theTextSize: 16,
                                        onTapped: () {
                                          _mypagecontroller.theIndex.value ==
                                                    7 ? _homecontroller.onFormSaved() :
                                          _homecontroller.completionStatus(
                                              _mypagecontroller.theIndex.value);
                                          _mypagecontroller.pageController
                                              .nextPage(
                                                  duration:
                                                      Duration(seconds: 3),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn);
                                          //
                                          // I still need to add what happends when done here
                                        })
                                    : SizedBox.shrink(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => _mypagecontroller.theIndex.value >= 2
                                    ? largeButton(
                                        thebuttonHeight: 50,
                                        thewidth: 100,
                                        theTextSize: 16,
                                        theText: 'Previous',
                                        onTapped: () {
                                          _mypagecontroller.pageController
                                              .previousPage(
                                                  duration:
                                                      Duration(seconds: 3),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn);
                                        })
                                    : SizedBox.shrink(),
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
