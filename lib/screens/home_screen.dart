import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../resources/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection('users').get().then(
      (querySnapshot) {
        for (var element in querySnapshot.docs) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(element.id)
              .get()
              .then((userDocumentSnapshot) {
            UserModel userModel =
                UserModel.fromMap(userDocumentSnapshot.data());

            userList.add(userModel);
            setState(() {});
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All User List")),
      body: ListView.separated(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.colorWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.colorSkipforNow,
                      blurRadius: 15,
                    )
                  ]),
              alignment: Alignment.center,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userList[index].firstname!,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.chatName,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Manrope'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: AppColor.colorWhite,
          height: 8,
          thickness: 0,
        ),
      ),
    );
  }
}
