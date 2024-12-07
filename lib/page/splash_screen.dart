import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/home_page.dart';
import 'package:this_books/page/onboarding.dart';
import 'package:this_books/page/login_page.dart';

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

    // تحقق مما إذا كان المستخدم شاهد شاشة الإعداد
    final hasSeenOnBoarding = prefs.getBool('hasSeenOnBoarding') ?? false;

    // تحقق مما إذا كان المستخدم قد سجل الدخول
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // تأخير لمدة 5 ثوانٍ (شاشة البداية)
    await Future.delayed(const Duration(seconds: 5));

    if (!hasSeenOnBoarding) {
      // إذا لم يشاهد شاشة الإعداد، انتقل إلى شاشة الإعداد
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    } else if (!isLoggedIn) {
      // إذا لم يقم بتسجيل الدخول، انتقل إلى شاشة تسجيل الدخول
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      // إذا كان مسجلًا بالفعل، انتقل إلى الصفحة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
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
                width: 400,
                height: 400,
              ),
              const SizedBox(height: 16.0),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
