import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sinaliza_compras/widgets/search_service.dart';

class StoriesScreen2 extends StatefulWidget {
  @override
  _StoriesScreen2State createState() => _StoriesScreen2State();
}

class _StoriesScreen2State extends State<StoriesScreen2> {
  var queryResultSet = [];
  var tempSearchStore = [];

  void initState() {
    Alldata();
    if (queryResultSet.length == 0) {
      Alldata().getAllData().then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          setState(() {
            tempSearchStore.add(docs.documents[i].data);
          });
        }
      });
    }
    super.initState();
  }

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Hashtag'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var size = MediaQuery
        .of(context)
        .size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 1) / 2.18;
    final double itemWidth = size.width / 2;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .08,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .85,
              child: TextFormField(
                onChanged: (val) {
                  if (val == '') {
                    tempSearchStore = [];
                    Alldata().getAllData().then((QuerySnapshot docs) {
                      for (int i = 0; i < docs.documents.length; ++i) {
                        setState(() {
                          tempSearchStore.add(docs.documents[i].data);
                        });
                      }
                    });
                  } else {
                    initiateSearch(val);
                  }
                },
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  fillColor: Colors.grey[150],
                  labelText: 'Encontrar um produto ou serviço',
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(28.0)),
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(28.0)),
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 4.0),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) {
                    return "vazio!";
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .1,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_left_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
        body: PhotoView.customChild(
            backgroundDecoration: BoxDecoration(color: Colors.purple),
            minScale: PhotoViewComputedScale.contained * 1.2,
            maxScale: PhotoViewComputedScale.covered * 4.0,
            initialScale: PhotoViewComputedScale.covered * 0.2,
            basePosition: Alignment.topLeft,
            childSize: MediaQuery
                .of(context)
                .size,
            child: GridView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 100),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisCount: 6,
                ),
                children: tempSearchStore.map((element) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)
                            =>
                                fullScreenStory(element),
                            )
                        );
                      },
                      child: buildResultCard(element));
                }).toList())));
  }
}

Widget buildResultCard(data) {
  return Card(
    elevation: 6,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      //side: BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(data['image'])),
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
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    )),
                padding: EdgeInsets.only(left: 2.5),
                child: Row(
                  children: [
                    Container(
                        height: 10.5,
                        width: 10.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(16))),
                        child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 5.5,
                                  fontWeight: FontWeight.bold),
                            ))
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width *.1,
                      padding: EdgeInsets.only(top: 0.6, left: 1.2),
                      child: Text(
                        data['titleProfile'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil.instance.setSp(08),),
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
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    )),
                child: Center(
                  child: Text(
                    data['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 3.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget fullScreenStory(data) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(data['image'])),
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
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    )),
                padding: EdgeInsets.only(
                  top: 23.0,
                  left: 12.5,
                ),
                child: Row(
                  children: [
                    Container(
                        height: 50.5,
                        width: 50.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(32))),
                        child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 32.5,
                                  fontWeight: FontWeight.bold),
                            ))
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width *.1,
                      padding: EdgeInsets.only(top: 0.6, left: 8.2),
                      child: Text(
                        data['titleProfile'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 65,
              child: SizedBox(),
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.all(.8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    )),
                child: Center(
                  child: Text(
                    data['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}