
import 'package:flutter/material.dart';

import '../resources/color_assets.dart';
import '../resources/string_asset.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
          StringAssets.txteventPage,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
