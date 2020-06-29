import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/utils/asset_path.dart';
import 'package:programmingebook/utils/url_launcher.dart';

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
//          Padding(
//            padding: const EdgeInsets.only(top:10.0),
//            child: FlatButton.icon(
//              label: Text('Phone- 09979247945',style: Styles.defaultTextStyle,),
//              icon: Icon(Icons.phone,color: Colors.blueAccent,),
//              onPressed: (){
//                UrlLauncher.makePhoneCall('+959979247945');
//              },
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(child: SvgPicture.asset(AssetsPath.svgpath+"facebook.svg",width: 40,height: 40),
                onTap: (){
                  UrlLauncher.launchInWebViewWithJavaScript('https://www.facebook.com/buddhamobile.apk/');
                },),
                SizedBox(width: 20,),
                GestureDetector(child:  SvgPicture.asset(AssetsPath.svgpath+"github.svg",width: 40,height: 40),
                  onTap: (){
                    UrlLauncher.launchInWebViewWithJavaScript('https://github.com/dev-mgkaung');
                  },),
                SizedBox(width: 20,),
                GestureDetector(child:   SvgPicture.asset(AssetsPath.svgpath+"gmail.svg",width: 40,height: 40),
                  onTap: (){
                    UrlLauncher.launchInWebViewWithJavaScript('https://www.google.com');
                  },),
              ],
            ),
          ),
        ]

    );
  }

}