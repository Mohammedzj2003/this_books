import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/page/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

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
            icon: const Icon(Icons.navigate_before, color: Colors.white, size: 35),
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: HeaderCurvedContainer(),
            child: Container(
              height: 150,
              child: const Center(
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
          user != null
              ? StreamBuilder<DocumentSnapshot>(
            stream: _firestore.collection('users').doc(user!.uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Center(child: Text('No data available'));
              }
              var userData = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 120),
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundImage: const AssetImage('images/logo.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.edit, color: Colors.white),
                                onPressed: () {
                                  // Handle edit action
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      itemProfile(AppLocalizations.of(context)!.name, userData['name'], CupertinoIcons.person),
                      const SizedBox(height: 10),
                      itemProfile(AppLocalizations.of(context)!.usarName, userData['username'], CupertinoIcons.tag),
                      const SizedBox(height: 10),

                    ],
                  ),
                ),
              );
            },
          )
              : Center(child: Text('User is not logged in')),
        ],
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.blueGrey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.cursorColor),
        ),
        leading: Icon(
          iconData,
          color: Theme.of(context).textSelectionTheme.selectionColor,
        ),
        trailing: Icon(Icons.arrow_forward),
        tileColor: Theme.of(context).colorScheme.primary,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilePage(title: title, subtitle: subtitle),
            ),
          );
        },
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff283E50);
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
