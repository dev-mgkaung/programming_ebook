import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeSearchBox extends StatefulWidget {
  @override
  _HomeSearchBoxState createState() => _HomeSearchBoxState();
}

class _HomeSearchBoxState extends State<HomeSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Search Bar
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 16),
          child: Text('Hi Mg Kaung',
              style: GoogleFonts.openSans(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 16),
          child: Text('latest_book'.tr().toString(),
              style: Styles.mediumTextStyle),
        ),
        Container(
          height: 35,
          margin: EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              TextField(
                maxLengthEnforced: true,
                style: Styles.mediumTextStyle,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  border: InputBorder.none,
                  hintText: 'search'.tr().toString(),
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
