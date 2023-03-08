import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spotify/Screens/StartPage.dart';
import 'package:spotify/Screens/homepage.dart';
import 'package:spotify/Utils/route_name.dart';

import 'Services/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('Homepage');
          // Navigator.pushReplacementNamed(context, RouteName.homepage);
          // Navigator.pushNamed(context, RouteName.homepage);
          return HomePage();
        } else {
          print('StartPage');
          return const StartPage();
        }
      },
    );
  }
}
