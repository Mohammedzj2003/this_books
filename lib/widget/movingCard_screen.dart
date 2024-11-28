import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:this_books/models/storys.dart';
import 'package:this_books/page/detail_page.dart';

class MovingCardScreen extends StatefulWidget {
  @override
  _MovingCardScreenState createState() => _MovingCardScreenState();
}

class _MovingCardScreenState extends State<MovingCardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Story> _storyList = Story.storyList;

    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return SizedBox(
      height: size.height * .25,
      child: ListView.builder(
          itemCount: _storyList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: DetailPage(
                          storyId: _storyList[index].storyId,
                        ),
                        type: PageTransitionType.bottomToTop));
              },
              child: Container(
                width: 155,
                margin: EdgeInsetsDirectional.only(
                    end: 10, start: index == 0 ? 10 : 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GridTile(
                    header: Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorite = toggleIsFavorated(
                                _storyList[index].isFavorated);
                            _storyList[index].isFavorated = isFavorite;
                          });
                        },
                        icon: Icon(
                          _storyList[index].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        iconSize: 30,
                      ),
                    ),
                    footer: Container(
                      width: double.infinity,
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Text(
                        _storyList[index].plantName,
                        style: TextStyle(
                            shadows: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 3),
                              )
                            ],
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    child: Image.asset(
                      _storyList[index].imageURL,
                      // width: 250,
                      // height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
