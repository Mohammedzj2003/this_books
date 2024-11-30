
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/models/storys.dart';
import 'package:this_books/page/chat_page.dart';
import 'package:this_books/widget/dialogFilter.dart';

class DetailPage extends StatefulWidget {
  final int storyId;

  const DetailPage({Key? key, required this.storyId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsList(bool isList) {
    return !isList;
  }

  @override
  Widget build(BuildContext context) {
    List<Story> _storyList = Story.storyList;
    Story currentStory = _storyList[widget.storyId];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff283E50),
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Color(0xff283E50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: const ChatPage(),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.comment,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          currentStory.imageURL,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        currentStory.plantName,
                        style: const TextStyle(
                          color: Colors.white, // لون النص
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 1,
              thickness: 2,
              color: Colors.black26,
              indent: 16,
              endIndent: 16,
            ),
            //star
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(
                      Icons.star,
                      size: 30.0,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      currentStory.rating.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorited =
                                toggleIsFavorated(currentStory.isFavorated);
                            currentStory.isFavorated = isFavorited;
                          });
                        },
                        icon: Icon(
                          size: 30.0,
                          currentStory.isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        )),
                    Text(
                      AppLocalizations.of(context)!.favorite,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.stars_outlined,
                        size: 30.0,
                        color: Colors.black26,
                      ),
                      onPressed: () {
                        thirdDialog.showRatingDialog(context);
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.rating,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bool isList = toggleIsFavorated(currentStory.isList);
                          currentStory.isList = isList;
                        });
                      },
                      icon: Icon(
                        size: 30.0,
                        currentStory.isList == true
                            ? Icons.add_box_outlined
                            : Icons.verified,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.addList,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            //description
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  currentStory.decription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 55,
            decoration: BoxDecoration(
              color:const Color(0xff283E50),
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
                AppLocalizations.of(context)!.readNow,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: const Color(0xff283E50),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.blue.withOpacity(.3),
              )
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {
              // Handle microphone action
            },
          ),
        ),
      ]),
    );
  }
}

class FavoriteStoriesProvider with ChangeNotifier {
  List<Story> _favoriteStories = [];

  List<Story> get favoriteStories => _favoriteStories;

  void addStory(Story story) {
    _favoriteStories.add(story);
    notifyListeners();
  }

  void removeStory(Story story) {
    _favoriteStories.remove(story);
    notifyListeners();
  }
}

class ListStoriesProvider with ChangeNotifier {
  List<Story> _listStories = [];

  List<Story> get favoriteStories => _listStories;

  void addStory(Story story) {
    _listStories.add(story);
    notifyListeners();
  }

  void removeStory(Story story) {
    _listStories.remove(story);
    notifyListeners();
  }
}
