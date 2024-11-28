import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:this_books/models/storys.dart';
import 'package:this_books/page/detail_page.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key? key,
    required this.index,
    required this.storyList,
  }) : super(key: key);
  final int index;
  final List<Story> storyList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  storyId: storyList[index].storyId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              storyList[index].imageURL,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 5.0),
            Text(
              storyList[index].plantName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.star,color: Colors.amber,),
                Text(storyList[index].rating.toString(),style: TextStyle(color: Colors.black87,fontSize: 17),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// flutterfire configure --android-app-id=com.example.my_books
