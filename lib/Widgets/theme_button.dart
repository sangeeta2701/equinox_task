
import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Utils/constant.dart';
import 'package:flutter/material.dart';

Widget themeButton(String buttonText, VoidCallback ontap) {
    return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      )),
                  onPressed: ontap,
                  child: Center(
                      child: Text(
                    buttonText,
                    style: buttonStyle,
                  )));
  }