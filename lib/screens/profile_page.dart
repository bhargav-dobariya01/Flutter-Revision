
import 'package:flutter/material.dart';

import '../resources/color_assets.dart';
import '../resources/string_asset.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringAssets.txtevent),
        centerTitle: true,
        backgroundColor: ColorAsset.blueColor,
      ),
      body: Center(
        child: Text(
          StringAssets.txtprofilepage,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
