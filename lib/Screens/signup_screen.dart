import 'package:equinox_task/Screens/login_screen.dart';
import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Utils/constant.dart';
import 'package:equinox_task/Widgets/sizedbox.dart';
import 'package:equinox_task/Widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _registerUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setString('email', emailController.text);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an Account!",
                    style: blackText,
                  ),
                  height4,
                  Text(
                    "Signup to Continue Your Journey Towards Better Mental Health and Well-Being",
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
                    controller: emailController,
                    style: textFieldText,
                    keyboardType: TextInputType.emailAddress,
                    
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter email";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Enter Correct email";
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
                      Fluttertoast.showToast(msg: "Signup Successful!!");
                      _registerUser(context);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
