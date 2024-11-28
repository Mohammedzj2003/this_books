import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/page/home_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                     Row(
                       children: [
                         SizedBox(
                           width: 10,
                         ),
                         IconButton(
                          onPressed: (){
                            Navigator
                                .pushReplacement(context, MaterialPageRoute(builder: (context)
                            =>
                            const HomePage()
                              ,
                            )
                            );
                          },
                          icon: Icon(Icons.dangerous_outlined,size: 35,color: Colors.black54,)
                                           ),
                       ],
                     ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          
                      const SizedBox(
                        height: 120,
                      ),
          
                      Image.asset('images/welcoom.png'),
                      const SizedBox(
                        height: 33,
                      ),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.welcome,
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 15,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
