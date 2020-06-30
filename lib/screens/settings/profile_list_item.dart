import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,

      margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 15),
          Icon(
            this.icon,
            size: 20,
          ),
          SizedBox(width: 15),
          Text(this.text,),
          Spacer(),
          if (this.hasNavigation)
            FaIcon(FontAwesomeIcons.arrowRight,size: 20,),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}