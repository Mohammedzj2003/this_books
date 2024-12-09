import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:this_books/models/storys.dart';
import 'package:this_books/page/detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
    required this.index,
    required this.storyList,
  });
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              storyList[index].imageURL,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            storyList[index].plantName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: Theme.of(context).textSelectionTheme.cursorColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(
                storyList[index].rating.toString(),
                style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.cursorColor,
                  fontSize: 17.sp,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// flutterfire configure --android-app-id=com.example.my_books
