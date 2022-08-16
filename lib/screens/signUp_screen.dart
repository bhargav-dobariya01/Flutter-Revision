import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:navigation_drawer/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../resources/app_color.dart';
import '../resources/app_string.dart';
import '../utils/check_internet_connectivity.dart.dart';
import '../utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SharedPreferences _prefs;

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  late double _deviceHeight;
  late double _deviceWidth;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: _signUpFormUi(),
        ),
      ),
    );
  }

  Widget _signUpFormUi() {
    return Stack(
      children: [
        Center(
          child: Visibility(
            visible: _isLoading,
            child: Container(
                margin: EdgeInsets.only(top: _deviceHeight / 2),
                child: const CircularProgressIndicator()),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/Logo3.png",
                  height: _deviceHeight * 0.18,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: _deviceHeight * 0.02,
                    bottom: _deviceHeight * 0.01,
                    right: _deviceWidth * 0.55),
                alignment: Alignment.center,
                child: Text(
                  AppString.txtSignUp,
                  style: TextStyle(
                      fontSize: _deviceHeight * 0.04,
                      fontWeight: FontWeight.bold,
                      color: AppColor.lightBlueColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.01),
                child: TextFormField(
                  // autovalidateMode: AutovalidateMode.always,
                  controller: _firstNameController,
                  decoration:
                      InputDecoration(labelText: AppString.txtfirstname),
                  validator: Validator.firstName,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.01),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: AppString.txtlastname),
                  validator: Validator.lastName,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.01),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _phoneController,
                  decoration:
                      InputDecoration(labelText: AppString.txtPhoneNumber),
                  validator: Validator.phoneNumber,
                ),
              ),

              //Email TextField
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.01),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration:
                      InputDecoration(labelText: AppString.txtEmailAddress),
                  validator: Validator.email,
                ),
              ),

              //Password TextField
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: _deviceWidth * 0.1,
                    right: _deviceWidth * 0.1,
                    bottom: _deviceHeight * 0.04),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: AppString.txtPassword),
                  obscureText: true,
                  validator: Validator.password,
                ),
              ),

              // Signup Button
              GestureDetector(
                onTap: () async {
                  final result = await Connectivity().checkConnectivity();
                  showConnectivityToast(result);
                  if (_formKey.currentState!.validate()) {
                    setState(
                      () {
                        _isLoading = true;
                      },
                    );
                    signUp(_emailController.text, _passwordController.text);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: _deviceWidth * 0.39),
                  width: _deviceWidth * 0.46,
                  height: _deviceHeight * 0.062,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.lightBlueColor2,
                        AppColor.lightBlueColor
                      ]),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  alignment: Alignment.center,
                  child: Text(
                    AppString.txtSignUp.toUpperCase(),
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
                  Navigator.pushReplacementNamed(context, "/login_screen");
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: _deviceWidth * 0.39, top: _deviceHeight * 0.020),
                  child: Text(AppString.txtAlreadyhaveAnAccount,
                      style: TextStyle(
                          fontSize: _deviceHeight * 0.018,
                          fontWeight: FontWeight.w700,
                          color: AppColor.purpleButton)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        setState(() {
          _isLoading = false;
        });
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    final prefs = await SharedPreferences.getInstance();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    prefs.setString(AppString.userIDKey, user.uid);

    userModel.firstname = _firstNameController.text;
    userModel.lastname = _lastNameController.text;
    userModel.phoneNumber = _phoneController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: AppString.txtaccountCreatedSuccessfully);

    if (ConnectivityResult.none != true) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}
