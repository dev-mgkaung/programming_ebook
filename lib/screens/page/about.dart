import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:programmingebook/utils/asset_path.dart';

class AboutPage
{
  AboutPage._();

  static void dialogShow(BuildContext context){
    showAboutDialog(
        context: context,
        applicationName: 'Programming Ebook',
        applicationVersion: '1.0.0',
        applicationIcon: Image(image: AssetImage(AssetsPath.logopath+"logo.png",),width: 40,height: 40,),
        applicationLegalese: 'Hey Guy , Nice to meet you again. This application is the Flutter bilopalte template for production level project.This project was created by  bloc pattern and viewmodel. Readable and easy to maintain',
        children:[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsPath.svgpath+"facebook.svg",width: 40,height: 40),
                SizedBox(width: 20,),
                SvgPicture.asset(AssetsPath.svgpath+"github.svg",width: 40,height: 40),
                SizedBox(width: 20,),
                SvgPicture.asset(AssetsPath.svgpath+"gmail.svg",width: 40,height: 40),
              ],
            ),
          ),
        ]

    );
  }

}