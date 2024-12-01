import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/home_page.dart';
import 'package:this_books/page/onboarding.dart';
import 'package:this_books/page/settings_page.dart';
import 'package:this_books/page/splash_screen.dart';
import 'package:this_books/shared/settings_provider.dart';
import 'package:this_books/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
      // apiKey: "YOUR_API_KEY",
      // authDomain: "YOUR_AUTH_DOMAIN",
      // projectId: "YOUR_PROJECT_ID",
      // storageBucket: "YOUR_STORAGE_BUCKET",
      // messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      // appId: "YOUR_APP_ID",
      // measurementId: "YOUR_MEASUREMENT_ID",
    // ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ar');

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'ar';
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      title: 'Akmar',
      theme: settingsProvider.isDarkMode ? kDarkMode : kLightMode,
      home: FutureBuilder(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            if (snapshot.data == true) {
              return const SettingPage();
            } else {
              return const OnBoarding();
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