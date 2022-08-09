import 'package:flutter/material.dart';
import 'package:navigation_drawer/screens/event_page.dart';
import 'package:navigation_drawer/screens/favorite_page.dart';

import '../resources/color_assets.dart';
import '../resources/string_asset.dart';

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
      appBar: AppBar(
        title: Text(StringAssets.txthomepage),
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const EventPage()));
              },
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
      ),
    );
  }
}
