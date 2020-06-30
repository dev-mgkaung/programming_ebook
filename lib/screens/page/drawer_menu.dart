import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/screens/page/about.dart';
import 'package:programmingebook/utils/asset_path.dart';
import 'package:easy_localization/easy_localization.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AssetsPath.imagepath + 'background.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 17.0,
            left: 18.0,
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                image: DecorationImage(
                    image: AssetImage(AssetsPath.imagepath + "mgkaung.jpg")),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'home_menu'.tr().toString(),
          ),
          _createDrawerItem(
            icon: Icons.new_releases,
            text: 'new_menu'.tr().toString(),
          ),
          _createDrawerItem(
            icon: Icons.card_giftcard,
            text: 'discount_menu'.tr().toString(),
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.book, text: 'free_book_menu'.tr().toString()),
          _createDrawerItem(
              icon: Icons.file_download,
              text: 'favourite_menu'.tr().toString()),
          _createDrawerItem(
              icon: Icons.picture_as_pdf, text: 'pdf_menu'.tr().toString()),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report, text: 'report_menu'.tr().toString()),
          _createDrawerItem(
              icon: Icons.sentiment_very_satisfied,
              text: 'about_menu'.tr().toString(),
              onTap: () {
                AboutPage.dialogShow(context);
              }),
        ],
      ),
    );
  }
}
