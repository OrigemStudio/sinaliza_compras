import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sinaliza_compras/widgets/story_grid/story_grid_lojas.dart';

class StoriesScreen extends StatefulWidget {
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final _searchController = TextEditingController();

  var left = 0.0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  String search = '';


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 13) / 2.18;
    final double itemWidth = size.width / 2;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Container(
            height: MediaQuery.of(context).size.height * .08,
            width: MediaQuery.of(context).size.width * .85,
            child: TextFormField(
              controller: _searchController,
              onChanged: (String query){
                setState(() {
                  search = query;
                });
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
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                ),
                contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  const BorderRadius.all(const Radius.circular(28.0)),
                  borderSide: BorderSide(color: Colors.transparent, width: 4.0),
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
            width: MediaQuery.of(context).size.width * .1,
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
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('cidades')
              .document('Rio Pardo')
              .collection('stories')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              return PhotoView.customChild(
                backgroundDecoration: BoxDecoration(color: Colors.purple),
                minScale: PhotoViewComputedScale.contained * 1.2,
                maxScale: PhotoViewComputedScale.covered * 4.0,
                initialScale: PhotoViewComputedScale.covered* 0.2,
                basePosition: Alignment.topLeft,
                childSize: MediaQuery.of(context).size,
                child: GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 6),
                    children: snapshot.data.documents.map((doc) {
                      return StoryGridLojas(doc, search);
                    }).toList()),
              );
            }
          }),
    );
  }
}
