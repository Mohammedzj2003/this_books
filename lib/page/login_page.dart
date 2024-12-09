import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    AuthController authController = Get.put(AuthController());
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
                      AppLocalizations.of(context)!.welcomeBack,
                      textDirection: TextDirection.ltr,
                      style:  TextStyle(
                        color: Theme.of(context).textSelectionTheme.selectionColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
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
                        style:  TextStyle(
                          color: Colors.blue,
                          fontSize: 18.sp,
                        ),
                      )),
                ),
                 SizedBox(
                  height: 33.h,
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
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: (){
                        authController.loginWithEmail();
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1649e4),
                        shadowColor: Colors.black,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('icons/google.png',width: 25.w,height: 25.h,),

                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            AppLocalizations.of(context)!.gmail,
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
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
                        text: AppLocalizations.of(context)!.haveNotAccount,
                        style: TextStyle(
                          fontSize: 15.sp,
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
                      style:  TextStyle(color: Colors.blue, fontSize: 15.sp),
                    ),
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


