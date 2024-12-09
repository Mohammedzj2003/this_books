import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/home_page.dart';
import 'package:this_books/page/onboarding.dart';
import 'package:this_books/page/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:this_books/page/settings_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();

    final hasSeenOnBoarding = prefs.getBool('hasSeenOnBoarding') ?? false;

    final isLoggedIn = prefs.getBool('isLoggedIn') ?? true;
    await Future.delayed(const Duration(seconds: 5));

    if (!hasSeenOnBoarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff283E50),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 400.w,
                height: 400.h,
              ),
               SizedBox(height: 16.h),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
