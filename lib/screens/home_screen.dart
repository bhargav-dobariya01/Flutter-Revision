import 'package:navigation_drawer/resources/color_assets.dart';
import 'package:navigation_drawer/resources/string_asset.dart';
import 'package:navigation_drawer/screens/allmail_screen.dart';
import 'package:navigation_drawer/screens/draft_screen.dart';
import 'package:navigation_drawer/screens/followup_screen.dart';
import 'package:navigation_drawer/screens/inbox_screen.dart';
import 'package:navigation_drawer/screens/sentmail_screen.dart';
import 'package:navigation_drawer/screens/spam_screen.dart';
import 'package:navigation_drawer/screens/starred_screen.dart';
import 'package:navigation_drawer/screens/trash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const email = 'bhargavdobariya06@gmail.com';
    const urlImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG_o7wLVS2EWUjk99rpg429GZbrcwSqXPmfg&usqp=CAU';
    return Scaffold(
      drawer: Drawer(
          child: Material(
        child: ListView(
          children: [
            buildHeader(
              urlImage: urlImage,
              email: email,
            ),
            buildMenuItem(
              text: StringAssets.txtinbox,
              icon: Icons.inbox,
              onClicked: () => selectedItem(0),
            ),
            buildMenuItem(
              text: StringAssets.txtstarred,
              icon: Icons.star_border_outlined,
              onClicked: () => selectedItem(1),
            ),
            buildMenuItem(
              text: StringAssets.txtsentmail,
              icon: Icons.mark_email_read,
              onClicked: () => selectedItem(2),
            ),
            buildMenuItem(
              text: StringAssets.txtdraftmail,
              icon: Icons.drafts_sharp,
              onClicked: () => selectedItem(3),
            ),
            buildMenuItem(
              text: StringAssets.txtallmail,
              icon: Icons.all_inbox,
              onClicked: () => selectedItem(4),
            ),
            buildMenuItem(
              text: StringAssets.txttrashmail,
              icon: Icons.delete_forever_outlined,
              onClicked: () => selectedItem(5),
            ),
            buildMenuItem(
              text: StringAssets.txtspam,
              icon: Icons.work_off_rounded,
              onClicked: () => selectedItem(6),
            ),
            buildMenuItem(
              text: StringAssets.txtfollowup,
              icon: Icons.art_track_outlined,
              onClicked: () => selectedItem(7),
            ),
          ],
        ),
      )),
      appBar: AppBar(
        title: Text(getTitle(selectedIndex)),
        centerTitle: true,
        backgroundColor: ColorAsset.blueColor,
      ),
      body: getScreen(selectedIndex),
    );
  }

  String getTitle(int selectedPosition) {
    switch (selectedPosition) {
      case 0:
        return StringAssets.txtinbox;
      case 1:
        return StringAssets.txtstarred;
      case 2:
        return StringAssets.txtsentmail;
      case 3:
        return StringAssets.txtdraftmail;
      case 4:
        return StringAssets.txtallmail;
      case 5:
        return StringAssets.txttrashmail;
      case 6:
        return StringAssets.txtspam;
      case 7:
        return StringAssets.txtfollowup;
      default:
        return StringAssets.txtinbox;
    }
  }

  Widget getScreen(int selectedPosition) {
    switch (selectedPosition) {
      case 0:
        return const InboxPage();
      case 1:
        return const StarredPage();
      case 2:
        return const SentaMailPagee();
      case 3:
        return const DraftMailPage();
      case 4:
        return const AllMailPage();
      case 5:
        return const TrashPage();
      case 6:
        return const SpamPage();
      case 7:
        return const FollowUpPage();
      default:
        return const InboxPage();
    }
  }

  buildHeader({required String urlImage, required String email}) => Container(
        decoration: BoxDecoration(color: ColorAsset.skybluecolor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  email,
                  style: TextStyle(color: ColorAsset.whitecolor),
                ))
          ],
        ),
      );
  selectedItem(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
    Navigator.pop(context);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    hoverColor: ColorAsset.blueColor,
    onTap: onClicked,
  );
}
