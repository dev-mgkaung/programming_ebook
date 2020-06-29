import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/utils/asset_path.dart';
import 'package:programmingebook/utils/url_launcher.dart';

class AboutPage {
  AboutPage._();

  static void dialogShow(BuildContext context) {
    showAboutDialog(
        context: context,
        applicationName: 'Programming Ebook',
        applicationVersion: 'about_version'.tr().toString(),
        applicationIcon: Image(
          image: AssetImage(
            AssetsPath.logopath + "logo.png",
          ),
          width: 40,
          height: 40,
        ),
        applicationLegalese: 'about_desc'.tr().toString(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: SvgPicture.asset(AssetsPath.svgpath + "facebook.svg",
                      width: 40, height: 40),
                  onTap: () {
                    UrlLauncher.launchInWebViewWithJavaScript(
                        'https://www.facebook.com/buddhamobile.apk/');
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: SvgPicture.asset(AssetsPath.svgpath + "github.svg",
                      width: 40, height: 40),
                  onTap: () {
                    UrlLauncher.launchInWebViewWithJavaScript(
                        'https://github.com/dev-mgkaung');
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: SvgPicture.asset(AssetsPath.svgpath + "gmail.svg",
                      width: 40, height: 40),
                  onTap: () {
                    UrlLauncher.launchInWebViewWithJavaScript(
                        'https://www.google.com');
                  },
                ),
              ],
            ),
          ),
        ]);
  }
}
