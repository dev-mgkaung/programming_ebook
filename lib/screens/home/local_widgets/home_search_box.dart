import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';

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
          child: Text(home_label,
              style: GoogleFonts.openSans(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 16),
          child: Text(latest_book, style: Styles.mediumTextStyle),
        ),
        Container(
          height: 35,
          margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              TextField(
                maxLengthEnforced: true,
                style: Styles.mediumTextStyle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 10, 16),
                  border: InputBorder.none,
                  hintText: 'Search book....',
                  hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
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