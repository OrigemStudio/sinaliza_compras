import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/stories_data.dart';
import 'package:sinaliza_compras/screens/promo_screen.dart';

class StoryCard extends StatefulWidget {
  StoriesData story;

  StoryCard(this.story);

  @override
  _StoryCardState createState() => _StoryCardState(this.story);
}

class _StoryCardState extends State<StoryCard> {
  StoriesData story;

  _StoryCardState(this.story);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PromoScreen()));
      },
      child: Container(
        child: Card(
          elevation: 6,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            //side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(story.image)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          )),
                      padding: EdgeInsets.only(left: 2.5),
                      child: Row(
                        children: [
                          Container(
                              height: 10.5,
                              width: 10.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: Center(child: Text('L',
                              style: TextStyle(
                                color: Colors.purple,fontSize: 5.5,
                                fontWeight: FontWeight.bold
                              ),
                              ))
                              /**
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(story.imageProfile),
                              )
                                  */
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *.1,
                            padding: EdgeInsets.only(
                              top: 0.6,
                                left: 1.2
                            ),
                            child: Text(
                              story.titleProfile,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 3.0
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 55,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 25,
                    child: Container(
                      padding: EdgeInsets.all(.8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          )),
                      child: Center(
                        child: Text(
                          story.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 3.0,
                              color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
