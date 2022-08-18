import 'package:flutter/material.dart';
import 'package:navigation_drawer/resources/app_color.dart';

import '../resources/app_string.dart';

class KotakBankPage extends StatefulWidget {
  const KotakBankPage({Key? key}) : super(key: key);

  @override
  State<KotakBankPage> createState() => _KotakBankPageState();
}

class _KotakBankPageState extends State<KotakBankPage> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardUi(AppString.txtKotakMahindraBank, AppColor.colorOrange,
                AppColor.colorOrange2),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _deviceHeight * 0.014, bottom: _deviceHeight * 0.014),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: AppColor.colorRblBankColor,
                      size: 24,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      AppString.txtEmi,
                      style: TextStyle(
                          color: AppColor.colorTataCardColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: _deviceHeight * 0.026),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _deviceWidth * 0.55),
                      child: Text(
                        AppString.txt$11732,
                        style: TextStyle(
                            color: AppColor.blackcolor.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: _deviceHeight * 0.026),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.03,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _deviceHeight * 0.014, bottom: _deviceHeight * 0.014),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: AppColor.colorTataCardColor2,
                      size: 24,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      AppString.txtInterestRate,
                      style: TextStyle(
                          color: AppColor.colorTataCardColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: _deviceHeight * 0.026),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _deviceWidth * 0.37),
                      child: Text(
                        AppString.txt$11,
                        style: TextStyle(
                            color: AppColor.blackcolor.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: _deviceHeight * 0.026),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.03,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _deviceHeight * 0.014, bottom: _deviceHeight * 0.014),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: AppColor.colorOrange2,
                      size: 24,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      AppString.txtProcessingFee,
                      style: TextStyle(
                          color: AppColor.colorTataCardColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: _deviceHeight * 0.026),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _deviceWidth * 0.34),
                      child: Text(
                        AppString.txt$129,
                        style: TextStyle(
                            color: AppColor.blackcolor.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: _deviceHeight * 0.026),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.03,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _deviceHeight * 0.014, bottom: _deviceHeight * 0.014),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: AppColor.greenColor,
                      size: 24,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      AppString.txtTenure,
                      style: TextStyle(
                          color: AppColor.colorTataCardColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: _deviceHeight * 0.026),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _deviceWidth * 0.49),
                      child: Text(
                        AppString.txt2Years,
                        style: TextStyle(
                            color: AppColor.blackcolor.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: _deviceHeight * 0.026),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.07,
            ),
            Container(
              margin: EdgeInsets.only(bottom: _deviceHeight * 0.0098),
              width: _deviceWidth * 0.28,
              height: _deviceHeight * 0.050,
              decoration: BoxDecoration(
                color: AppColor.greenColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                AppString.txtApply,
                style: TextStyle(
                  fontSize: 19,
                  color: AppColor.whitecolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.07,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.colorTataCardColor2,
                    AppColor.colorPlusButton
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  "\u207a",
                  style: TextStyle(
                      fontSize: _deviceHeight * 0.06,
                      color: AppColor.whitecolor),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget CardUi(title, color1, color2) {
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
            ],
          ),
        ),
      ),
    );
  }
}
