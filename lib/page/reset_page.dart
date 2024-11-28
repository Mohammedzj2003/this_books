import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:share_plus/share_plus.dart';
import 'package:this_books/models/whoarewe_page.dart';
import 'package:this_books/page/Forget%20Password/forgetPass_Page.dart';
import 'package:this_books/page/settings_page.dart';
import 'package:this_books/shared/constants.dart';



class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfff3f3f3) ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

               Row(
                 children: [
                   IconButton(onPressed: (){
                        Navigator
                            .pop(context, MaterialPageRoute(builder: (context)
                        =>
                        const SettingPage(),
                        )
                        );
                      },
                          icon: Icon(Icons.navigate_before_outlined,size: 40,)
                      ),
                   SizedBox(
                     width: 20,
                   ),
                 ],
               ),



            SizedBox(
              height: 50,
            ),

                    Row(
                      children: [
                        Text(AppLocalizations.of(context)!.resetApp,

                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),


            SizedBox(
              height: 50,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
              SettingOption(
                icon: _obscureText ? Icons.notifications : Icons
                    .notifications_active,
                title:AppLocalizations.of(context)!.notifications,

                trailing: Text('on'),
                textColor: Colors.black,
                iconColor: Colors.white,
                iconBackgroundColor: Colors.blue,
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },),
                  SizedBox(
                    height: 10,
                  ),
                  SettingOption(
                    icon: Icons.share,
                    title: AppLocalizations.of(context)!.shareApp,
                    trailing: Icon(Icons.arrow_forward_ios),
                    textColor: Colors.black,
                    iconColor: Colors.white ,
                    iconBackgroundColor: Colors.lightGreenAccent,
                    onTap:(){
                      Share.share('Check out this amazing app!');
                    },

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SettingOption(
                    icon: Icons.error_outline,
                    title: AppLocalizations.of(context)!.about,
                    trailing: Icon(Icons.arrow_forward_ios),
                    textColor: Colors.black,
                    iconColor: Colors.white ,
                    iconBackgroundColor: Colors.purple,
                    onTap:(){
                      Navigator
                          .push(context, MaterialPageRoute(builder: (context)
                      =>
                      const WhoAreWePage(),
                      )
                      );
                    },

                  ),
                ],
              ),
            ),

            SizedBox(
              height: 50,
            ),

            Container(
              height:100 ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 20,
                  ),

                  SettingOption(
                    icon: Icons.password,
                    title: AppLocalizations.of(context)!.changePassword,
                    trailing: Icon(Icons.arrow_forward_ios),
                    textColor: Colors.black,
                    iconColor: Colors.white ,
                    iconBackgroundColor: Colors.brown,
                    onTap:(){
                      Navigator
                          .pushReplacement(context, MaterialPageRoute(builder: (context)
                      =>
                      const ForgetPassPage(),
                      )
                      );
                    },

                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

