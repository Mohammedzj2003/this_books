// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_books/widget/navDrower_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WhoAreWePage extends StatelessWidget {
  const WhoAreWePage({super.key});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavdrowerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.aboutUs,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: const Color(0xff283E50),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'icons/vector.svg',
                width: 5,
                height: 5,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              AppLocalizations.of(context)!.aboutUs,
                overflow: TextOverflow.fade,
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold ,
                    color: Theme.of(context).colorScheme.onPrimary,

        ),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.aboutUsDec,
                overflow: TextOverflow.fade,
                style:  TextStyle(fontSize: 16,color: Theme.of(context).textSelectionTheme.cursorColor,),
              ),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)!.ourTeam,
                overflow: TextOverflow.fade,
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary,),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.ourTeamDec,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16,color: Theme.of(context).textSelectionTheme.cursorColor,),
              ),
              const SizedBox(height: 32),
              Text(
                  AppLocalizations.of(context)!.contactUs,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary,),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _launchURL('mailto:q2df2003@gmail.com'),
                child: Row(
                  children: [
                    Image.network("https://img.icons8.com/3d-fluency/94/google-logo.png",width: 20,height: 20,),
                    const Text(
                      '  : q2df2003@gmail.com',
                      overflow: TextOverflow.fade,

                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _launchURL('https://wa.me/+97059-223-8378'),
                child: Row(
                  children: [
                    Image.network("https://img.icons8.com/color/48/whatsapp--v1.png",width: 25,height: 25,),
                    const Text(
                      '  : +97059-223-8378',
                      overflow: TextOverflow.fade,

                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _launchURL('https://www.instagram.com/q_2df'),
                child: Row(
                  children: [
                    Image.network("https://img.icons8.com/3d-fluency/94/instagram-logo.png",height: 25,width: 25,),
                    const Text(
                      '  : @q_2df',
                      overflow: TextOverflow.fade,

                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
