
import 'package:flutter/material.dart';
import 'package:myapp3/pages/choose_location.dart';
import 'package:myapp3/pages/loading.dart';
import 'package:myapp3/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home':(context) => const Home(),
      '/location':(context) => const ChooseLocation()
    },
  ));


}