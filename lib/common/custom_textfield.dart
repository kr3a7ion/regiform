import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/obscurecontroller.dart';

final ObscureTextController obscureText = Get.put(ObscureTextController());

Widget customTextField(
  TextEditingController textController, {
  double theHeight = 50,
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
              border: Border.all(width: 2, color: Colors.orange),
              color: Colors.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                keyboardType: keyboardType,
                controller: textController,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.orange,
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
                  labelStyle:
                      const TextStyle(color: Colors.orange, fontSize: 13),
                  prefixIcon: usePrefix
                      ? Icon(
                          leadingIcon,
                          color: Colors.orange,
                          size: 16,
                        )
                      : null,
                  suffixIcon: useSuffix
                      ? Icon(
                          suffixIcon,
                          color: Colors.orange,
                          size: 16,
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
  String lableText = 'Password',
  double theHeight = 50,
  IconData leadingIcon = Icons.lock,
}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: theHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: Colors.orange),
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
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.orange,
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
                        const TextStyle(color: Colors.orange, fontSize: 13),
                    prefixIcon: Icon(
                      leadingIcon,
                      color: Colors.orange,
                      size: 16,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText.toogleObscure();
                      },
                      icon: Icon(
                        obscureText.isActive.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.orange,
                        size: 16,
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
