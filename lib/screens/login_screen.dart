import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:navigation_drawer/screens/forgot_password_screen.dart';
import 'package:navigation_drawer/screens/home_screen.dart';
import 'package:navigation_drawer/screens/signUp_screen.dart';
import 'package:navigation_drawer/utils/check_internet_connectivity.dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/app_color.dart';
import '../resources/app_string.dart';
import '../utils/validator.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  bool isLoading = false;
  late SharedPreferences _prefs;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late double _deviceHeight;
  late double _deviceWidth;
  // Login Function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "user-not-found") {
        Fluttertoast.showToast(
            msg: AppString.txtnoUserFoundFromThisMail,
            textColor: AppColor.colorWhite,
            backgroundColor: AppColor.colorBlack);
      } else if (e.code == 'unknown') {
        Fluttertoast.showToast(
            msg: AppString.txtplsEnterValidEmail,
            textColor: AppColor.colorWhite,
            backgroundColor: AppColor.colorBlack);
      } else if (e.code == ' wrong-password') {
        Fluttertoast.showToast(
            msg: AppString.txtplsEnterValidEmail,
            textColor: AppColor.colorWhite,
            backgroundColor: AppColor.colorBlack);
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg: AppString.txtToomanyattemps,
            textColor: AppColor.colorWhite,
            backgroundColor: AppColor.colorBlack);
      }
    }
    return user;
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPref) {
      _prefs = sharedPref;
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: const BoxDecoration(
        // background color
        image: DecorationImage(
            image: AssetImage(
              "assets/images/bg_image.png",
            ),
            fit: BoxFit.cover), // background image above color
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: _getLoginForm(),
          ),
        ),
      ),
    );
  }

  Widget _getLoginForm() {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          //progressindicator
          Center(
            child: Visibility(
              visible: isLoading,
              child: Container(
                  margin: EdgeInsets.only(top: _deviceHeight / 2),
                  child: const CircularProgressIndicator()),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Logo3.png",
                height: _deviceHeight / 5,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: _deviceHeight * 0.04,
                    bottom: _deviceHeight * 0.05,
                    right: _deviceWidth * 0.62),
                alignment: Alignment.center,
                child: Text(
                  AppString.txtlogin,
                  style: TextStyle(
                    fontSize: _deviceHeight * 0.04,
                    fontWeight: FontWeight.bold,
                    color: AppColor.lightBlueColor,
                  ),
                ),
              ),

              //Email TextField
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.04),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: InputDecoration(labelText: AppString.txtUsername),
                  validator: Validator.email,
                ),
              ),

              //Password TextField
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.01),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: AppString.txtPassword),
                  obscureText: true,
                ),
              ),
              //Forgot password
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: _deviceWidth * 0.09, bottom: _deviceHeight * 0.05),
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.txtForgotPassword,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColor.lightBlueColor,
                    ),
                  ),
                ),
              ),

              // Signin Button
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  if (user != null) {
                    await _prefs.setString(AppString.userIDKey, user.uid);
                  }
                  final result = await Connectivity().checkConnectivity();
                  setState(() {
                    isLoading = false;
                  });
                  showConnectivityToast(result);
                  if (_formKey.currentState!.validate()) {
                    if (user != null && ConnectivityResult.none != true) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  } else if (ConnectivityResult.none == true) {
                    showConnectivityToast(result);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: _deviceWidth * 0.46),
                  width: _deviceWidth * 0.46,
                  height: _deviceHeight * 0.062,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.lightBlueColor2,
                          AppColor.lightBlueColor,
                        ],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  alignment: Alignment.center,
                  child: Text(
                    AppString.txtSignIn,
                    style: TextStyle(
                      fontSize: 19,
                      color: AppColor.whitecolor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: _deviceWidth * 0.45, top: _deviceHeight * 0.025),
                  child: Text(
                    AppString.txtDontHaveAnAccountSignup,
                    style: TextStyle(
                      fontSize: _deviceHeight * 0.018,
                      fontWeight: FontWeight.w500,
                      color: AppColor.purpleButton,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
