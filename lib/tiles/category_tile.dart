import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/perfils_empresas/category_screen_lojas.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      padding: const EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0, bottom: 32.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),

        ),
        title: Text(snapshot.data["title"], style: TextStyle(
            fontSize: ScreenUtil.instance.setSp(45)),),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>CategoryScreenLojas(snapshot))
          );
        },
      ),
    );
  }
}
