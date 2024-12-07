import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditProfilePage extends StatelessWidget {
  final String title;
  final String subtitle;

  EditProfilePage({required this.title, required this.subtitle});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = subtitle;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit $title'),
        backgroundColor: Color(0xff283E50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: title,
                hintText: subtitle,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () async {
                  // Handle save action
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    String fieldName;
                    switch (title.toLowerCase()) {
                      case 'اسم':
                        fieldName = 'name';
                        break;

                      case 'اسم المستخدم':
                        fieldName = 'username';
                        break;
                      default:
                        fieldName = title.toLowerCase();
                    }
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .update({fieldName: _controller.text});
                    Navigator.pop(context);
                  } else {
                    print('User is not logged in');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff283E50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
