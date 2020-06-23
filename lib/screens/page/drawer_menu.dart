import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:  AssetImage('assets/images/background.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 17.0,
            left: 18.0,
            child: Container(
              width: 100,height: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                image: DecorationImage(
                  image: AssetImage("assets/images/mgkaung.jpg")
                ),
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
          Positioned(
              bottom: 12.0,
              right: 16.0,
              child: Text("Mg Kaung",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'GalleryIcons',
                      fontWeight: FontWeight.w700))),
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
          _createDrawerItem(icon: Icons.home,text: 'Home',),
          _createDrawerItem(icon: Icons.new_releases, text: 'New Books',),
          _createDrawerItem(icon: Icons.card_giftcard, text: 'Discount Books',),
          Divider(),
          _createDrawerItem(icon: Icons.book, text: 'Free Book'),
          _createDrawerItem(icon: Icons.file_download, text: 'Download'),
          _createDrawerItem(icon: Icons.picture_as_pdf, text: 'Pdf Viewer'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          _createDrawerItem(icon: Icons.sentiment_very_satisfied,text: 'About',onTap: (){
            showAboutDialog(
              context: context,
              applicationName: 'Programming Ebook',
              applicationVersion: '1.0.0',
              applicationIcon: Image(image: AssetImage("assets/logo/logo.png"),),
              applicationLegalese: 'Hey Guy , Nice to meet you again. This application is the first project of my creation.This pj was developeb by flutter lanugage with bloc pattern. Readable and easy to maintain',
            //  children: aboutBoxChildren,
            );
          }),

        ],
      ),
    );
  }
}
