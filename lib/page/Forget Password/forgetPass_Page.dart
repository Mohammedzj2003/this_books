import 'package:flutter/material.dart';
import 'package:this_books/page/Forget%20Password/newPass_page.dart';
import 'package:this_books/shared/constants.dart';


class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.navigate_before_outlined,size: 40,)
                  ),
                ),

                const SizedBox(height: 33,),
                const Text('Forget Password!',
                    textDirection: TextDirection.ltr,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: decorationTextFiled.copyWith(
                      labelText: 'Enter your email',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email),
                    )),
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
                        const NewpassPage()
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
