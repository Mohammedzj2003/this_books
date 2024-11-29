import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/home_page.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/page/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ar'),
      title: 'Akmar',
      home: FutureBuilder(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            if (snapshot.data == true) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          }
        },
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    return email != null && password != null;
  }
}
