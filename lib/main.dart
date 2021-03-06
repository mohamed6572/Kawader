import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/social_layout.dart';
import 'package:souq/modules/social_login/social_login_screan.dart';
import 'package:souq/shared/Bloc_Observer.dart';
import 'package:souq/shared/components/constens.dart';
import 'package:souq/shared/network/local/casheHelper.dart';
void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await casheHelper.Init();
        Widget? widget;
     uId = casheHelper.getData(key: "uId");
      if (uId != null) {
        widget = SocialLayout();
      } else {
        widget = SocialLoginScrean();
      }
      print(uId);

      runApp(MyApp(
     StartWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  Widget? StartWidget;
MyApp({required this.StartWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home:   EasySplashScreen(
        logo:Image(image: AssetImage("assets/images/logo.jpeg")),
        logoSize: 80,
        title: Text(
          "كوادر فور يو",
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        showLoader: false,
        navigator: StartWidget,
        durationInSeconds: 2,
      ),
    );

  }
}
