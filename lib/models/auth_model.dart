import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_books/page/home_page.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/page/notifications_page.dart';
import 'package:this_books/page/welcome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();


class AuthPage {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Firebase Sign In
  Future<void> signIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(AppLocalizations.of(context)!.mistakeLogin),
        ),
      );
    }
  }

  //Firebase Register
  Future<void> register(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController usernameController) async {
    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('كلمة المرور يجب أن تكون 8 خانات على الأقل.'),
        ),
      );
      throw FirebaseAuthException(
        code: 'weak-password',
        message: 'The password provided is too weak.',
      );
    }

    try {
      // التحقق من وجود البريد الإلكتروني
      List<String> signInMethods =
          await _auth.fetchSignInMethodsForEmail(emailController.text);
      if (signInMethods.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('البريد الإلكتروني مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        throw FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'An account already exists with that email.',
        );
      }

      // التحقق من وجود اسم المستخدم
      var usernameQuery = await _firestore
          .collection('users')
          .where('username', isEqualTo: usernameController.text)
          .get();
      if (usernameQuery.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
            content: Text('اسم المستخدم مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        throw FirebaseAuthException(
          code: 'username-already-in-use',
          message: 'An account already exists with that username.',
        );
      }

      // إنشاء المستخدم
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // حفظ اسم المستخدم في Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
      });

      // تأخير بسيط قبل الانتقال إلى الصفحة الرئيسية
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const WelcomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'كلمة المرور ضعيفة جدًا. يرجى اختيار كلمة مرور أقوى.';
      } else if (e.code == 'email-already-in-use') {
        message =
            'البريد الإلكتروني مستخدم بالفعل. يرجى استخدام بريد إلكتروني آخر.';
      } else if (e.code == 'username-already-in-use') {
        message = 'اسم المستخدم مستخدم بالفعل. يرجى اختيار اسم مستخدم آخر.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل في التسجيل: $e'),
        ),
      );
    }
  }


  // Firebase Sign out
  Future<void> signout({
    required BuildContext context,
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }
}

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  //Firebase Sign In gmail
  void loginWithEmail() async {
    isLoading.value = true;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAll(HomePage());
    } catch (ex) {
      print(ex);
    }

    isLoading.value = false;
  }
}


