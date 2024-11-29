import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/page/reset_page.dart';
import 'package:this_books/shared/constants.dart';
import 'package:this_books/widget/navDrower_widget.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavdrowerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xff283E50),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'icons/vector.svg',
                width: 5,
                height: 5,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  SettingOption(
                    icon: Icons.language,
                    trailing: Text(AppLocalizations.of(context)!.en),
                    title: AppLocalizations.of(context)!.language,
                    textColor: Colors.black,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.cyan,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SettingOption(
                    icon: Icons.nightlight_round,
                    title: AppLocalizations.of(context)!.darkMode,
                    trailing:Text(""),
                    textColor: Colors.black,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.green,
                    onTap: () {
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SettingOption(
                    icon: Icons.text_fields,
                    title: AppLocalizations.of(context)!.fontSize,
                    trailing: Text(AppLocalizations.of(context)!.large),
                    textColor: Colors.black,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.purple,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SettingOption(
                    icon: Icons.refresh,
                    title: AppLocalizations.of(context)!.resetApp,
                    trailing: Icon(Icons.arrow_forward_ios),
                    textColor: Colors.black,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.amber,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SettingOption(
                    icon: Icons.logout,
                    title: AppLocalizations.of(context)!.logout,
                    trailing: SizedBox.shrink(),
                    textColor: Colors.red,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.red,
                    onTap: () async {
                      // تسجيل الخروج من FirebaseAuth
                      await FirebaseAuth.instance.signOut();

                      // إزالة بيانات تسجيل الدخول من SharedPreferences
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.remove('email');
                      await prefs.remove('password');

                      // الانتقال إلى صفحة تسجيل الدخول
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
