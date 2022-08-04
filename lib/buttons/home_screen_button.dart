import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  String button_text = "";
  Color button_color;
  final Function onPressed;
  HomeButton(
      {Key? key,
      required this.button_text,
      required this.button_color,
      required this.onPressed})
      : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10),
      child: ElevatedButton(
          onPressed: () {
            widget.onPressed();
          },
          child: Text(
            widget.button_text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: widget.button_color,
            elevation: 0,
            side: (const BorderSide(color: Colors.black)),
            minimumSize: const Size(100, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          )),
    );
  }
}
