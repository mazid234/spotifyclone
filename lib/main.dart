import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/StartPage.dart';
import 'package:spotify/Utils/colors.dart';
import 'package:spotify/Utils/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/Utils/route_name.dart';
import 'package:spotify/Utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Palette.kToDark,
          textTheme: GoogleFonts.promptTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: colorPrimary
          // primarySwatch: Colors.blue,
          ),
      // home: const MyHomePage(),
      initialRoute: RouteName.widgetTree,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return StartPage();
  }
}
