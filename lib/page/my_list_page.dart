import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_books/widget/navDrower_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavdrowerWidget(),
      appBar: AppBar(
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
                width: 5.w,
                height: 5.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
