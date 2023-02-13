import 'package:flutter/material.dart';
import 'package:spotify/Utils/assets.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(startImage));
  }
}
