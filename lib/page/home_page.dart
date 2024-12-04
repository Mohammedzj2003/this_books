
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/models/storys.dart';
import 'package:this_books/page/profile_page.dart';
import 'package:this_books/widget/dialogFilter.dart';
import 'package:this_books/widget/movingCard_screen.dart';
import 'package:this_books/widget/navDrower_widget.dart';
import 'package:this_books/widget/story_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Story> _storyList = Story.storyList;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      //Navigtor Drower
      drawer: const NavdrowerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: const Color(0xff283E50),
        surfaceTintColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset('icons/vector.svg'),
            );
          }
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const ProfilePage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsetsDirectional.only(end: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17,
                backgroundImage: AssetImage(
                  'images/logo.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xff283E50),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(AppLocalizations.of(context)!.hi,
                            style:const  TextStyle(
                                color: Colors.white, fontSize: 25)),
                        const Text(
                          'Mohammed',
                          style:
                              TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          width: 280,
                          decoration: BoxDecoration(
                            color:Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          //Search
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Theme.of(context).textSelectionTheme.cursorColor
                              ),
                             const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context)!.search,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Dialogfilter(),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {
                            SecondDialog.showSecondDialog(context);
                          },
                          icon: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.famous,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //PageView 5s
            MovingCardScreen(),

            //Story
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.newStory,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: _storyList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 210,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      StoryWidget(index: index, storyList: _storyList),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
