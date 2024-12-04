
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:this_books/models/auth_model.dart';
import 'package:this_books/page/Forget%20Password/forgetPass_Page.dart';
import 'package:this_books/page/register_page.dart';
import 'package:this_books/page/welcome_page.dart';

import '../shared/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                const SizedBox(
                  height: 200,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      textDirection: TextDirection.ltr,
                      style:  TextStyle(
                        color: Theme.of(context).textSelectionTheme.selectionColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
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
                const SizedBox(height: 33),
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
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassPage(),
                            ));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 33,
                ),
                //ButtonSign In
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: (){
                        _authPage.signIn( context,_emailController, _passwordController);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff283E50),
                        shadowColor: Colors.black,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.next,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Text.rich(
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.haveNotAccount,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).textSelectionTheme.cursorColor,
                        )
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: AppLocalizations.of(context)!.signUp,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegisterPage()));
                            })
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.guest,
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('icons/facebook.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset('icons/twitter.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset('icons/google.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
