import 'package:equinox_task/Screens/main_screen.dart';
import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Utils/constant.dart';
import 'package:equinox_task/Widgets/sizedbox.dart';
import 'package:equinox_task/Widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: blackText,
                ),
                height4,
                Text(
                  "Log In to Continue Your Journey Towards Better Mental Health and Well-Being",
                  style: greyContent,
                ),
                height30,
                TextFormField(
                  controller: usernameController,
                  style: textFieldText,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z]+|\s'),
                        allow: true)
                  ],
                  decoration: InputDecoration(hintText: "Username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter username";
                    }
                    if (value.length < 3) {
                      return "Username can't be less than 3 characters";
                    }
                    if (value.length > 20) {
                      return "Username can't be more  than 20 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                height20,
                TextFormField(
                  controller: passwordController,
                  style: textFieldText,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 5) {
                      return "Password can't be less than 5 characters";
                    }
                    if (value.length > 15) {
                      return "Password can't be more  than 15 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                height40,
                themeButton("Login", () {
                  if (_formKey.currentState!.validate()) {
                    Fluttertoast.showToast(msg: "Login Successful!!");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
