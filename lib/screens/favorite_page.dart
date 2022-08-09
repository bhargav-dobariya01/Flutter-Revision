import 'package:flutter/material.dart';
import 'package:navigation_drawer/screens/event_page.dart';

import '../resources/color_assets.dart';
import '../resources/string_asset.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;

    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringAssets.txtfavoritepage),
        centerTitle: true,
        backgroundColor: ColorAsset.blueColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const EventPage()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: _deviceWidth * 0.4,
                height: _deviceHeight * 0.06,
                decoration: BoxDecoration(
                    color: ColorAsset.blueColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                alignment: Alignment.center,
                child: Text(
                  "Push and Remove Untill EventPage",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorAsset.whitecolor,
                    fontWeight: FontWeight.w500,
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
