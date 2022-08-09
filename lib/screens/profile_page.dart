import 'package:flutter/material.dart';

import '../resources/color_assets.dart';
import '../resources/string_asset.dart';
import 'favorite_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;

    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(StringAssets.txtevent),
          centerTitle: true,
          backgroundColor: ColorAsset.blueColor,
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritePage()));
              },
              child: Container(
                width: _deviceWidth * 0.4,
                height: _deviceHeight * 0.06,
                decoration: BoxDecoration(
                    color: ColorAsset.blueColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                alignment: Alignment.center,
                child: Text(
                  "push",
                  style: TextStyle(
                    fontSize: 19,
                    color: ColorAsset.whitecolor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _deviceWidth * 0.4,
                height: _deviceHeight * 0.06,
                decoration: BoxDecoration(
                    color: ColorAsset.blueColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                alignment: Alignment.center,
                child: Text(
                  "Replacement",
                  style: TextStyle(
                    fontSize: 19,
                    color: ColorAsset.whitecolor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        ));
  }
}
