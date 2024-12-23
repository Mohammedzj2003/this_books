import 'package:flutter/material.dart';
import 'package:this_books/page/Forget%20Password/forgetPass_Page.dart';
import 'package:this_books/page/login_page.dart';
import 'package:this_books/shared/constants.dart';

class NewpassPage extends StatefulWidget {
  const NewpassPage({super.key});

  @override
  State<NewpassPage> createState() => _NewpassPageState();
}

class _NewpassPageState extends State<NewpassPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar:AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: (){
                        Navigator
                            .pushReplacement(context, MaterialPageRoute(builder: (context)
                        =>
                        const ForgetPassPage()
                          ,
                        )
                        );
                      },
                      icon: const Icon(Icons.navigate_before_outlined,size: 40,)
                  ),
                ),
                const SizedBox(height: 33,),


                const Text('New Password!',
                  style: TextStyle(
                    color: Color(0xff283E50),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: decorationTextFiled.copyWith(
                    labelText: 'Modern Password',
                    border: const OutlineInputBorder(),
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

                const SizedBox(height: 33),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: decorationTextFiled.copyWith(
                    labelText: 'New Password',
                    border: const OutlineInputBorder(),
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
                //ButtonSign In
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator
                            .pushReplacement(context, MaterialPageRoute(builder: (context)
                        =>
                        const LoginPage()
                        ,
                        )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff283E50),
                        shadowColor: Colors.black,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

