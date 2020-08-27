import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/profile_data.dart';
import 'package:sinaliza_compras/perfils_empresas/profile_screen.dart';

class ProfileTile extends StatelessWidget {
  final ProfileData profile;

  ProfileTile(this.profile);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfileScreen(profile)));
      },
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 1.5,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *.02,
                bottom: MediaQuery.of(context).size.height *.02,
            left: MediaQuery.of(context).size.height *.02,
            right: MediaQuery.of(context).size.height *.02),
            child: Card(
              color: Colors.white.withOpacity(0.3),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(profile.imageProfile)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height /20,
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        profile.titleProfile,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil.instance.setSp(40),
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
