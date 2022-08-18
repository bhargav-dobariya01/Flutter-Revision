import 'package:flutter/material.dart';
import 'package:navigation_drawer/resources/app_color.dart';
import 'package:navigation_drawer/resources/app_string.dart';
import 'package:navigation_drawer/screens/kotak_bank.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Column(
            children: [
              CardUi(AppString.txtKotakMahindraBank, AppColor.colorOrange,
                  AppColor.colorOrange2),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              CardUi(AppString.txtTataCapital, AppColor.colorTataCardColor,
                  AppColor.colorTataCardColor2),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              CardUi(
                AppString.txtRblBank,
                AppColor.colorRblBankColor,
                AppColor.colorRblBankColor2,
              ),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: PlusIcon(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CardUi(
    title,
    color1,
    color2,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Container(
        height: _deviceHeight * 0.24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color1, color2],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: _deviceHeight * 0.01,
              top: _deviceHeight * 0.01,
              bottom: _deviceHeight * 0.01,
              right: _deviceWidth * 0.035),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColor.whitecolor.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: _deviceHeight * 0.03),
                ),
              ),
              //Loan Amount
              Positioned(
                top: _deviceHeight * 0.14,
                child: Text(
                  AppString.txtLoanAmount,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColor.whitecolor.withOpacity(0.4),
                  ),
                ),
              ),
              Positioned(
                top: _deviceHeight * 0.17,
                child: Text(
                  AppString.txt$25000,
                  style: TextStyle(
                      color: AppColor.whitecolor,
                      fontWeight: FontWeight.w600,
                      fontSize: _deviceHeight * 0.028),
                ),
              ),
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const KotakBankPage()));
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _deviceHeight * 0.0098),
                    width: _deviceWidth * 0.28,
                    height: _deviceHeight * 0.050,
                    decoration: BoxDecoration(
                      color: AppColor.whitecolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppString.txtApply,
                      style: TextStyle(
                        fontSize: 19,
                        color: AppColor.colorApplyButton,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PlusIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.colorTataCardColor2, AppColor.colorPlusButton],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          "\u207a",
          style: TextStyle(
              fontSize: _deviceHeight * 0.06, color: AppColor.whitecolor),
        ),
      ),
    );
  }
}
