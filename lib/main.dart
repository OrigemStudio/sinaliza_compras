import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/cards/slide_screen.dart';
import 'package:sinaliza_compras/model/list_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'model/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<ListModel>(
            model: ListModel(model),
            child: MaterialApp(
              localizationsDelegates:[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
                supportedLocales: [const Locale('pt', 'BR')],
              title: 'Sinaliza Compras',
              theme: ThemeData(
                primaryColor: Colors.purple,
              ),
              debugShowCheckedModeBanner: false,
              home: SlideScreen(),
            ),
          );
        },
      ),
    );
  }
}
