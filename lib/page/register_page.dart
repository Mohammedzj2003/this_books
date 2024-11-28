import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/page/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _register() async {
    if (_passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('كلمة المرور يجب أن تكون 8 خانات على الأقل.'),
        ),
      );
      return;
    }

    try {
      // التحقق من وجود البريد الإلكتروني
      List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(_emailController.text);
      if (signInMethods.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('البريد الإلكتروني مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        return;
      }

      // التحقق من وجود اسم المستخدم
      QuerySnapshot usernameSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: _usernameController.text)
          .get();
      if (usernameSnapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('اسم المستخدم مستخدم بالفعل من قبل حساب آخر.'),
          ),
        );
        return;
      }

      // إنشاء حساب جديد
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // حفظ اسم المستخدم في قاعدة البيانات
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'username': _usernameController.text,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(33.0),
    child: Column(
    children: [
    const SizedBox(
    height: 150,
    ),
    Row(
    children: [
    Text(
    AppLocalizations.of(context)!.newAccount,
    textDirection: TextDirection.ltr,
    style: TextStyle(
    color: Color(0xff283E50),
    fontSize: 25,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(
    width: 20,
    ),
    ],
    ),
    const SizedBox(
    height: 33,
    ),
    TextFormField(
    controller: _usernameController,
    keyboardType: TextInputType.text,
    obscureText: false,
    decoration: decorationTextFiled.copyWith(
    hintText: AppLocalizations.of(context)!.enterUserName,
    prefixIcon: const Icon(Icons.person_rounded),
    ),
    ),
    const SizedBox(
    height: 33,
    ),
    TextFormField(
    keyboardType: TextInputType.text,
    obscureText: false,
    decoration: decorationTextFiled.copyWith(
    hintText: AppLocalizations.of(context)!.enterFirstName,
    prefixIcon: const Icon(Icons.person_pin_rounded),
    ),
    ),
    const SizedBox(
    height: 33,
    ),
    //Email
    TextFormField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: decorationTextFiled.copyWith(
    hintText: AppLocalizations.of(context)!.enterEmail,
    prefixIcon: const Icon(Icons.email),
    ),
    ),
    const SizedBox(height: 33),
    TextFormField(
    controller: _passwordController,
    keyboardType: TextInputType.text,
    decoration: decorationTextFiled.copyWith(
    hintText: AppLocalizations.of(context)!.password,
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: IconButton(
    icon: Icon(
    _obscureText ? Icons.visibility : Icons.visibility_off,
    ),
    onPressed: _togglePasswordVisibility,
    ),
    ),
    obscureText: _obscureText,
    ),
    const SizedBox(
    height: 33,
    ),
    //Sign In
    SizedBox(
    width: double.infinity,
    child: ElevatedButton(
    onPressed: _register,
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff283E50),
    shadowColor: Colors.black,
    elevation: 15,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
    ),
    padding: const EdgeInsets.symmetric(
    horizontal: 40, vertical: 20), // الحشوة الداخلية
    ),
    child: Text(
    AppLocalizations.of(context)!.next,
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    const SizedBox(
    height: 33,
    ),
    Text.rich(
    style: TextStyle(
    fontSize: 15,
    ),
    TextSpan(
    children: [
    TextSpan(
    text: AppLocalizations.of(context)!.haveAccount,
    ),
    TextSpan(text: ' '),
    TextSpan(
    text: AppLocalizations.of(context)!.signIn,
    style: TextStyle(
    color: Colors.blue, fontWeight: FontWeight.bold),
    recognizer: TapGestureRecognizer()
    ..onTap = () {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) => LoginPage()));
    })
    ],
    ),
    ),
    const SizedBox(
    height: 20,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
