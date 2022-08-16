import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_drawer/screens/login_screen.dart';

import '../resources/app_color.dart';
import '../resources/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreeen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/pharmly_logo.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                  child: Text(AppString.txtPharmly,
                      style: const TextStyle(
                        fontSize: 36,
                      )),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(color: AppColor.colorBlack12.withAlpha(20)),
        ),
      ),
    );
  }
}
