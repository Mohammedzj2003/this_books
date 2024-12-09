import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/models/auth_model.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/shared/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
  final AuthPage _authPage = AuthPage();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              children: [
                 SizedBox(
                  height: 100.h,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.newAccount,
                      textDirection: TextDirection.ltr,
                      style:  TextStyle(
                        color: Theme.of(context).textSelectionTheme.selectionColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                 SizedBox(
                  height: 33.h,
                ),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: decorationTextFiled.copyWith(
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: AppLocalizations.of(context)!.enterUserName,
                    prefixIcon: const Icon(Icons.person_rounded),
                  ),
                ),
                 SizedBox(
                  height: 33.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: decorationTextFiled.copyWith(
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: AppLocalizations.of(context)!.enterName,
                    prefixIcon: const Icon(Icons.person_pin_rounded),
                  ),
                ),
                 SizedBox(
                  height: 33.h,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationTextFiled.copyWith(
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                 SizedBox(height: 33.h),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: decorationTextFiled.copyWith(
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
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
                 SizedBox(
                  height: 33.h,
                ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _authPage.register(context, _emailController, _passwordController, _usernameController);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff283E50),
                  shadowColor: Colors.black,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.next,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
                 SizedBox(
                  height: 33.h,
                ),
                Text.rich(
                  style:  TextStyle(
                    fontSize: 15.sp,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.haveAccount,
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: AppLocalizations.of(context)!.signIn,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
