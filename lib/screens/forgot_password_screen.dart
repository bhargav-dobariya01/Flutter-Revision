import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_color.dart';
import '../resources/app_string.dart';
import '../utils/check_internet_connectivity.dart.dart';
import '../utils/validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late double _deviceHeight;
  late double _deviceWidth;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: const BoxDecoration(
        // background Desaign
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
            child: _ForgotPasswordUi(),
          ),
        ),
      ),
    );
  }

  Widget _ForgotPasswordUi() {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          //Logo
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
                ),
                alignment: Alignment.center,
                child: Text(
                  AppString.txtForgotPassword2,
                  style: TextStyle(
                    fontSize: _deviceHeight * 0.038,
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

              // Submit Button
              GestureDetector(
                onTap: () async {
                  _emailController.clear();
                  final result = await Connectivity().checkConnectivity();
                  showConnectivityToast(result);

                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) {
                      Navigator.pop(context);
                    });
                    Fluttertoast.showToast(
                        msg: AppString.txtpasswordLinkSentSuccessfully,
                        backgroundColor: AppColor.colorLetsGetStarted);
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: AppString.txtPleaseEnterValidEmailAddress,
                        backgroundColor: AppColor.colorLetsGetStarted);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: _deviceWidth * 0.30, top: _deviceHeight * 0.06),
                  width: _deviceWidth * 0.37,
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
                    AppString.txtSubmit,
                    style: TextStyle(
                      fontSize: 19,
                      color: AppColor.whitecolor,
                      fontWeight: FontWeight.w700,
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
