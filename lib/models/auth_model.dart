import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:this_books/page/welcome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AuthPage {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
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

  Future<void> register(BuildContext context, TextEditingController emailController, TextEditingController passwordController, TextEditingController usernameController) async {
    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('كلمة المرور يجب أن تكون 8 خانات على الأقل.'),
        ),
      );
      return;
    }

    try {
      // التحقق من وجود البريد الإلكتروني
      List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(emailController.text);
      if (signInMethods.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('البريد الإلكتروني مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        return;
      }

      // التحقق من وجود اسم المستخدم
      var usernameQuery = await _firestore.collection('users')
          .where('username', isEqualTo: usernameController.text)
          .get();
      if (usernameQuery.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('اسم المستخدم مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        return;
      }

      // إنشاء حساب جديد
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // حفظ بيانات المستخدم في Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
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
}
