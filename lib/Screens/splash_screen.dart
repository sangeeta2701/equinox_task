import 'package:equinox_task/Screens/login_screen.dart';
import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 60.h,
                left: 70.w,
                child: Text(
                  "Mind",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w400,
                      color: themeColor),
                )),
            Positioned(
                top: 90.h,
                right: 60.w,
                child: Text(
                  "GLOW",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w600,
                      color: themeColor),
                )),
            Positioned(
                top: 250.h,
                left: 60.w,
                right: 60.w,
                child: themeButton("Start Here",(){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));})),
            Positioned(
                top: 180.h,
                left: 40.w,
                right: 40.w,
                child: Text(
                  "Empower Your Mind and Embrace Life's Challenges with Our Comprehensive Mental Health Support App.",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: lightThemeColor),
                  textAlign: TextAlign.center,
                )),
            Positioned(
                bottom: 0.h,
                left: 30.w,
                right: 30.w,
                child: Image.asset("assets/images/img1.png")),
          ],
        ),
      ),
    );
  }

  
}
