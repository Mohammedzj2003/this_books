import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff283E50),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: Icon(Icons.navigate_before, color: Colors.white, size: 35),
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: HeaderCurvedContainer(),
            child: Container(
              height: 150,
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 120),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('images/logo.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                itemProfile(AppLocalizations.of(context)!.name, 'Ahad Hashmi', CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile(AppLocalizations.of(context)!.usarName, '@q_2df', CupertinoIcons.tag),
                const SizedBox(height: 10),
                itemProfile(AppLocalizations.of(context)!.email, 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xff283E50),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Colors.blue.withOpacity(.3),
            )
          ],
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.editProfile,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.blueGrey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff283E50);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
