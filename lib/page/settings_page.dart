import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/main.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/page/profile_page.dart';
import 'package:this_books/page/reset_page.dart';
import 'package:this_books/shared/constants.dart';
import 'package:this_books/shared/settings_provider.dart';
import 'package:this_books/widget/navDrower_widget.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      drawer: const NavdrowerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: const Color(0xff283E50),
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
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  SettingOption(
                    icon: Icons.person,
                    title: AppLocalizations.of(context)!.editProfile,
                    trailing: const Icon(Icons.arrow_forward_ios),
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                  SettingOption(
                    icon: Icons.language,
                    trailing: Text(
                      AppLocalizations.of(context)!.en,
                    ),
                    title: AppLocalizations.of(context)!.language,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.cyan,
                    onTap: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      String currentLanguage =
                          prefs.getString('language') ?? 'ar';

                      String newLanguage =
                      currentLanguage == 'ar' ? 'en' : 'ar';
                      await prefs.setString('language', newLanguage);

                      MyApp.setLocale(context, Locale(newLanguage));
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SettingOption(
                    icon: Icons.nightlight_round,
                    title: AppLocalizations.of(context)!.darkMode,
                    trailing: Switch(
                      value: settingsProvider.isDarkMode,
                      onChanged: settingsProvider.toggleTheme,
                    ),
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.black54,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SettingOption(
                    icon: Icons.refresh,
                    title: AppLocalizations.of(context)!.resetApp,
                    trailing: const Icon(Icons.arrow_forward_ios),
                    textColor: Theme.of(context).colorScheme.onPrimary,
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
                  const SizedBox(
                    height: 10,
                  ),
                  SettingOption(
                    icon: Icons.logout,
                    title: AppLocalizations.of(context)!.logout,
                    trailing: const SizedBox.shrink(),
                    textColor: Colors.red,
                    iconColor: Colors.white,
                    iconBackgroundColor: Colors.red,
                    onTap: () async {
                      // تسجيل الخروج من FirebaseAuth
                      await FirebaseAuth.instance.signOut();

                      // إزالة بيانات تسجيل الدخول من SharedPreferences
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
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
