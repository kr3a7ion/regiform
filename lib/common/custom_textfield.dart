import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/obscurecontroller.dart';
import 'package:regiform/common/custom_largebutton.dart';

final ObscureTextController obscureText = Get.put(ObscureTextController());

Color borderColor = custompurpleColor;
Color iconColor = customPurpleColor2;
Color hintTextColor = Colors.grey.shade400;
Color textFieldColor = Colors.black;

Widget customTextField(
  TextEditingController textController, {
  double theHeight = 70,
  double thefontSize = 16,
  double thelableFontSize = 16,
  double theIconSize = 20,
  String lableText = 'Username',
  TextInputType keyboardType = TextInputType.name,
  IconData leadingIcon = Icons.person,
  IconData suffixIcon = Icons.calendar_month_rounded,
  bool usePrefix = true,
  bool useSuffix = false,
}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: theHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: borderColor),
              color: Colors.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                keyboardType: keyboardType,
                controller: textController,
                style: TextStyle(
                    fontSize: thefontSize,
                    color: textFieldColor,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: 12,
                    left: usePrefix ? 0 : 12,
                    top: 0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: lableText,
                  labelStyle: TextStyle(
                      color: hintTextColor, fontSize: thelableFontSize),
                  prefixIcon: usePrefix
                      ? Icon(
                          leadingIcon,
                          color: iconColor,
                          size: theIconSize,
                        )
                      : null,
                  suffixIcon: useSuffix
                      ? Icon(
                          suffixIcon,
                          color: iconColor,
                          size: theIconSize,
                        )
                      : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

//
Widget customPasswordTextField(
  TextEditingController passwordController, {
  double theHeight = 70,
  double thefontSize = 16,
  double thelableFontSize = 16,
  double theIconSize = 20,
  String lableText = 'Password',
  IconData leadingIcon = Icons.lock,
}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: theHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: borderColor),
              color: Colors.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Obx(
                () => TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText.isActive.value ? false : true,
                  obscuringCharacter: '*',
                  controller: passwordController,
                  style: TextStyle(
                      fontSize: thefontSize,
                      color: textFieldColor,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 12,
                      top: 0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: lableText,
                    labelStyle:
                        TextStyle(color: hintTextColor, fontSize: thefontSize),
                    prefixIcon: Icon(
                      leadingIcon,
                      color: iconColor,
                      size: theIconSize,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText.toogleObscure();
                      },
                      icon: Icon(
                        obscureText.isActive.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: iconColor,
                        size: theIconSize,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
